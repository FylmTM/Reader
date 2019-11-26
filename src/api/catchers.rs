use rocket_contrib::json::JsonValue;

#[catch(401)]
pub fn catcher_unauthorized() -> JsonValue {
    json!({
        "status": "error",
        "error": "Unauthorized."
    })
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
