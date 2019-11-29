use crate::api::ApiError;
use rocket_contrib::json::Json;

#[catch(401)]
pub fn catcher_unauthorized() -> Json<ApiError> {
    Json(ApiError::with("Unauthorized.".to_string()))
}

#[catch(404)]
pub fn catcher_not_found() -> Json<ApiError> {
    Json(ApiError::with("Not found.".to_string()))
}

#[catch(500)]
pub fn catcher_internal_error() -> Json<ApiError> {
    Json(ApiError::with("Internal error.".to_string()))
}
