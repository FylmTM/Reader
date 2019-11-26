use rocket::http::Status;
use rocket::request::FromRequest;
use rocket::{Outcome, Request, State};

use crate::db::entities::User;
use crate::db::find_user;
use crate::error::Error as AppError;
use crate::Context;

impl<'a, 'r> FromRequest<'a, 'r> for User {
    type Error = AppError;

    fn from_request(request: &'a Request<'r>) -> rocket::request::Outcome<Self, AppError> {
        let context = request
            .guard::<State<Context>>()
            .expect("Failed to get context.");

        let result = request
            .cookies()
            .get("api_key")
            .and_then(|cookie| Some(cookie.value()))
            .and_then(|api_key| match authenticate(context, api_key) {
                Ok(user) => Some(Outcome::Success(user)),
                Err(error) => Some(Outcome::Failure((Status::Unauthorized, error))),
            });

        match result {
            Some(result) => result,
            None => Outcome::Failure((Status::Unauthorized, AppError::ApiKeyNotPresent)),
        }
    }
}

fn authenticate(context: State<Context>, api_key: &str) -> Result<User, AppError> {
    let conn = context.pool.clone().get()?;
    find_user(&conn, api_key)
}
