use rocket::http::Status;
use rocket::request::FromRequest;
use rocket::{Outcome, Request, State};

use crate::db::entities::User;
use crate::db::find_user;
use crate::error::{ApplicationError, Error as E};
use crate::Context;

impl<'a, 'r> FromRequest<'a, 'r> for User {
    type Error = E;

    fn from_request(request: &'a Request<'r>) -> rocket::request::Outcome<Self, E> {
        let context = request
            .guard::<State<Context>>()
            .expect("Failed to get context.");

        let result = request
            .cookies()
            .get("api_key")
            .and_then(|cookie| Some(cookie.value()))
            .and_then(|api_key| match authenticate(context, api_key) {
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

fn authenticate(context: State<Context>, api_key: &str) -> Result<User, E> {
    let conn = context.pool.clone().get()?;
    find_user(&conn, api_key)
}
