pub mod assets;
pub mod authentication;
pub mod catchers;
pub mod endpoints;

use crate::error::Error;
use rocket_contrib::json::Json;

#[derive(Serialize, Deserialize)]
pub struct ApiResponse<T> {
    status: String,
    payload: T,
}

#[derive(Serialize, Deserialize)]
pub struct ApiError {
    status: String,
    message: String,
}

impl<T> ApiResponse<T> {
    pub fn with(payload: T) -> ApiResponse<T> {
        ApiResponse {
            status: "ok".to_string(),
            payload,
        }
    }
}

impl ApiError {
    pub fn with(message: String) -> ApiError {
        ApiError {
            status: "error".to_string(),
            message,
        }
    }
}

type Response<T> = Result<Json<ApiResponse<T>>, Error>;

fn ok<T>(data: T) -> Response<T> {
    Ok(Json(ApiResponse::with(data)))
}
