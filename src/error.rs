use std::io::Cursor;

use rocket::http::Status;
use rocket::response::Responder;
use rocket::{Request, Response};

use ApplicationError::*;

use crate::api::ApiError;

pub type Result<T> = std::result::Result<T, Error>;

#[derive(Debug)]
pub enum Error {
    App(ApplicationError),
    Pool(r2d2::Error),
    DB(rusqlite::Error),
    HttpClient(reqwest::Error),
    RSS(rss::Error),
    Atom(atom_syndication::Error),
    Chrono(chrono::ParseError),
}

#[derive(Debug)]
pub enum ApplicationError {
    AuthenticationApiKeyNotFound,
    FailedGetUrlContent(String),
    RSSParsingMissingItemLink,
    RSSParsingMissingItemTitle,
    AtomParsingMissingEntryLink,
    QueryEntityAlreadyExists,
    QueryEntityNotFound,
    QueryUnexpectedRowCount { expected: i64, actual: i64 },
}

impl Error {
    fn describe(self) -> (Status, String) {
        match self {
            Error::App(AuthenticationApiKeyNotFound) => {
                (Status::NotFound, "API key does not exists.".to_string())
            }
            Error::App(QueryUnexpectedRowCount { expected, actual }) => (
                Status::BadRequest,
                format!("Expected row count {}, got {}.", expected, actual),
            ),
            Error::DB(rusqlite::Error::QueryReturnedNoRows) => {
                (Status::NotFound, "Entity not found.".to_string())
            }
            _ => (Status::InternalServerError, format!("{:?}", self)),
        }
    }
}

impl<'r> Responder<'r> for Error {
    fn respond_to(self, _: &Request) -> std::result::Result<Response<'r>, Status> {
        let (http_status, message) = self.describe();

        let json = serde_json::to_string(&ApiError::with(message))
            .expect("Failed to serialize api error.");

        Response::build()
            .header(rocket::http::ContentType::JSON)
            .sized_body(Cursor::new(json))
            .status(http_status)
            .ok()
    }
}

impl From<rusqlite::Error> for Error {
    fn from(error: rusqlite::Error) -> Error {
        Error::DB(error)
    }
}

impl From<r2d2::Error> for Error {
    fn from(error: r2d2::Error) -> Error {
        Error::Pool(error)
    }
}

impl From<reqwest::Error> for Error {
    fn from(error: reqwest::Error) -> Error {
        Error::HttpClient(error)
    }
}

impl From<rss::Error> for Error {
    fn from(error: rss::Error) -> Error {
        Error::RSS(error)
    }
}

impl From<atom_syndication::Error> for Error {
    fn from(error: atom_syndication::Error) -> Error {
        Error::Atom(error)
    }
}

impl From<chrono::ParseError> for Error {
    fn from(error: chrono::ParseError) -> Error {
        Error::Chrono(error)
    }
}
