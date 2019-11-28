use rocket::http::Status;
use rocket::request::FromRequest;
use rocket::{Outcome, Request, State};

use crate::db;
use crate::db::AcquireConnection;
use crate::db::User;
use crate::error::{ApplicationError, Error as E};

impl<'a, 'r> FromRequest<'a, 'r> for User {
    type Error = E;

    fn from_request(request: &'a Request<'r>) -> rocket::request::Outcome<Self, E> {
        let pool = request
            .guard::<State<db::Pool>>()
            .expect("Failed to get context.");

        let result = request
            .cookies()
            .get("api_key")
            .and_then(|cookie| Some(cookie.value()))
            .and_then(|api_key| match authenticate(&pool, api_key) {
                Ok(user) => Some(Outcome::Success(user)),
                Err(error) => {
                    info!("Failed to authenticate user: {:?}.", error);
                    Some(Outcome::Failure((Status::Unauthorized, error)))
                }
            });

        match result {
            Some(result) => result,
            None => {
                info!("Failed to authenticate user: api key not present.");
                Outcome::Failure((
                    Status::Unauthorized,
                    E::App(ApplicationError::AuthenticationApiKeyNotFound),
                ))
            }
        }
    }
}

fn authenticate(pool: &db::Pool, api_key: &str) -> Result<User, E> {
    let conn = pool.conn()?;
    db::find_user(&conn, api_key)
}
