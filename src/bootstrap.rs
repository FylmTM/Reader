use rocket_contrib::json::{JsonValue};

pub struct Context {
    pub pool: r2d2::Pool<r2d2_sqlite::SqliteConnectionManager>,
}

#[catch(404)]
pub fn catcher_not_found() -> JsonValue {
    json!({
        "status": "error",
        "error": "Not found."
    })
}

#[catch(500)]
pub fn catcher_internal_error() -> JsonValue {
    json!({
        "status": "error",
        "error": "Internal error"
    })
}
