use rocket::State;
use rocket_contrib::json::Json;

use crate::api::ApiResponse;
use crate::bootstrap::Context;
use crate::db::{find_posts, Post};
use crate::error::Error;

#[get("/")]
pub fn index(context: State<Context>) -> Result<Json<ApiResponse<Vec<Post>>>, Error> {
    let conn = context.pool.clone().get()?;
    find_posts(&conn).map(|posts| Json(ApiResponse::with(posts)))
}
