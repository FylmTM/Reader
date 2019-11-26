use rocket::http::Status;
use rocket::response::Responder;
use rocket::{Request, Response};
use std::io::Cursor;

#[derive(Debug)]
pub enum Error {
    ApiKeyNotPresent,
    PoolError(r2d2::Error),
    DatabaseError(rusqlite::Error),
}

impl From<rusqlite::Error> for Error {
    fn from(error: rusqlite::Error) -> Error {
        Error::DatabaseError(error)
    }
}

impl From<r2d2::Error> for Error {
    fn from(error: r2d2::Error) -> Error {
        Error::PoolError(error)
    }
}

impl<'r> Responder<'r> for Error {
    fn respond_to(self, _: &Request) -> Result<Response<'r>, Status> {
        let message = format!("{:?}", self);
        let json = json!({
            "status": "error",
            "error": message
        });
        Response::build()
            .header(rocket::http::ContentType::JSON)
            .sized_body(Cursor::new(json.0.to_string()))
            .status(rocket::http::Status::InternalServerError)
            .ok()
    }
}
