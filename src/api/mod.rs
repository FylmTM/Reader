use crate::error::Error;
use rocket_contrib::json::Json;

pub mod authentication;
pub mod catchers;
pub mod endpoints;

#[derive(Serialize, Deserialize)]
pub struct ApiResponse<T> {
    status: String,
    payload: T,
}

impl<T> ApiResponse<T> {
    fn with(payload: T) -> ApiResponse<T> {
        ApiResponse {
            status: "ok".to_string(),
            payload,
        }
    }
}

type Response<T> = Result<Json<ApiResponse<T>>, Error>;

fn ok<T>(data: T) -> Response<T> {
    Ok(Json(ApiResponse::with(data)))
}
