use std::ops::Add;

use rocket::http::{Cookie, Cookies};
use rocket_contrib::json::Json;

use crate::api::{ok, Response};
use crate::db::{self, Queries};

#[derive(Serialize, Deserialize)]
pub struct ApiKey {
    pub api_key: String,
}

#[post("/api/v1/authenticate", data = "<api_key>")]
pub fn authenticate(
    api_key: Json<ApiKey>,
    conn: db::PoolConnection,
    mut cookies: Cookies,
) -> Response<db::User> {
    let api_key = api_key.0.api_key;
    let user = conn.find_user_by_api_key(&api_key)?;
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
