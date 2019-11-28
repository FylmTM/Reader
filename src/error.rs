use rocket::http::Status;
use rocket::response::Responder;
use rocket::{Request, Response};
use std::io::Cursor;
use ApplicationError::*;

#[derive(Debug)]
pub enum Error {
    App(ApplicationError),
    Pool(r2d2::Error),
    DB(rusqlite::Error),
}

#[derive(Debug)]
pub enum ApplicationError {
    AuthenticationApiKeyNotFound,
}

impl Error {
    fn describe(self) -> (Status, String) {
        match self {
            Error::App(AuthenticationApiKeyNotFound) => {
                (Status::NotFound, "API key does not exists.".to_string())
            }
            Error::DB(rusqlite::Error::QueryReturnedNoRows) => {
                (Status::NotFound, "Entity not found.".to_string())
            }
            _ => (Status::InternalServerError, format!("{:?}", self)),
        }
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

impl<'r> Responder<'r> for Error {
    fn respond_to(self, _: &Request) -> Result<Response<'r>, Status> {
        let (http_status, message) = self.describe();

        let json = json!({
            "status": "error",
            "error": message
        });

        Response::build()
            .header(rocket::http::ContentType::JSON)
            .sized_body(Cursor::new(json.0.to_string()))
            .status(http_status)
            .ok()
    }
}
