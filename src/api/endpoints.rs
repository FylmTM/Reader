use crate::api::{ok, Response};
use crate::db;
use rocket::http::{Cookie, Cookies};
use std::ops::Add;

#[get("/api/v1/authenticate/<api_key>")]
pub fn authenticate(
    api_key: String,
    conn: db::PoolConnection,
    mut cookies: Cookies,
) -> Response<db::User> {
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
