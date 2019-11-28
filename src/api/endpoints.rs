use std::ops::Add;

use rocket::http::RawStr;
use rocket::http::{Cookie, Cookies};
use rocket::State;

use crate::api::{ok, Response};
use crate::db;
use crate::Context;

#[get("/api/v1/authenticate/<api_key>")]
pub fn authenticate(
    api_key: &RawStr,
    context: State<Context>,
    mut cookies: Cookies,
) -> Response<db::User> {
    let conn = context.pool.clone().get()?;
    let api_key = api_key.as_str().to_string();

    let user = db::find_user(&conn, &api_key)?;

    cookies.add(
        Cookie::build("api_key", api_key)
            .path("/")
            .http_only(true)
            .expires(time::now().add(time::Duration::days(365)))
            .finish(),
    );

    ok(user)
}

#[get("/api/v1/current_user")]
pub fn current_user(user: db::User) -> Response<db::User> {
    ok(user)
}
