use std::ops::Add;

use rocket::http::RawStr;
use rocket::http::{Cookie, Cookies};
use rocket::State;
use rocket_contrib::json::Json;

use crate::api::ApiResponse;
use crate::db;
use crate::error::Error;
use crate::Context;

type Response<T> = Result<Json<ApiResponse<T>>, Error>;

#[get("/api/v1/authenticate/<api_key>")]
pub fn authenticate(
    api_key: &RawStr,
    context: State<Context>,
    mut cookies: Cookies,
) -> Response<db::User> {
    let conn = context.pool.clone().get()?;
    let api_key = api_key.as_str().to_string();

    match db::find_user(&conn, &api_key) {
        Ok(user) => {
            let api_key_cookie = Cookie::build("api_key", api_key)
                .path("/")
                .http_only(true)
                .expires(time::now().add(time::Duration::days(365)))
                .finish();
            cookies.add(api_key_cookie);
            Ok(Json(ApiResponse::with(user)))
        }
        Err(error) => Err(error),
    }
}

#[get("/api/v1/current_user")]
pub fn current_user(user: db::User) -> Response<db::User> {
    Ok(Json(ApiResponse::with(user)))
}
