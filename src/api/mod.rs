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
