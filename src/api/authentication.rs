use rocket::http::Status;
use rocket::request::FromRequest;
use rocket::{Outcome, Request};

use crate::db::{self, Queries, User};
use crate::error::{ApplicationError, Error as E};

/// Request guard to get user from api_key cookie.
/// Serves as authentication mechanism for all routes.
impl<'a, 'r> FromRequest<'a, 'r> for User {
    type Error = E;

    fn from_request(request: &'a Request<'r>) -> rocket::request::Outcome<Self, E> {
        let conn = request
            .guard::<db::PoolConnection>()
            .expect("Failed to get pool.");

        let result = request
            .cookies()
            .get("api_key")
            .and_then(|cookie| Some(cookie.value()))
            .and_then(|api_key| match conn.find_user_by_api_key(api_key) {
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
