use std::ops::Add;

use rocket::http::{Cookie, Cookies};
use rocket_contrib::json::Json;

use crate::api::{ok, Response};
use crate::db::{self, Queries};

#[derive(Serialize, Deserialize)]
pub struct ApiKey {
    pub api_key: String,
}

#[post("/api/v1/auth/login", data = "<api_key>")]
pub fn auth_login(
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

#[post("/api/v1/auth/logout")]
pub fn auth_logout(mut cookies: Cookies) -> Response<()> {
    cookies.add(
        Cookie::build("api_key", "")
            .path("/")
            .http_only(true)
            .expires(time::now().add(time::Duration::milliseconds(1)))
            .finish(),
    );

    ok(())
}

#[get("/api/v1/current_user")]
pub fn current_user(user: db::User) -> Response<db::User> {
    ok(user)
}

#[get("/api/v1/categories_with_feeds")]
pub fn categories_with_feeds(
    user: db::User,
    conn: db::PoolConnection,
) -> Response<db::CategoriesWithFeeds> {
    let categories = conn.find_categories_by_user_id(user.id)?;

    // todo: consider optimizing by doing one query to get all feeds,
    //       and then mapping them to their categories
    //       Will it actually be faster?
    let mut categories_with_feeds = Vec::with_capacity(categories.len());
    for category in categories {
        let feeds = conn.find_feeds_by_category_id(category.id)?;
        categories_with_feeds.push(db::CategoryWithFeeds { category, feeds })
    }

    ok(categories_with_feeds)
}
