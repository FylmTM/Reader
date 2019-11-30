use reader;
use reader::api::endpoints::*;
use reader::api::{ApiError, ApiResponse};
use rocket::http::uri::Origin;
use rocket::http::Status;
use rocket::local::{Client, LocalRequest, LocalResponse};
use rocket::uri;

pub fn client() -> Client {
    let app = reader::app(true);
    Client::new(app).expect("failed to construct rocket client")
}

pub fn authenticated_client() -> Client {
    let app = reader::app(true);
    let client = Client::new(app).expect("failed to construct rocket client");
    client.get_uri(uri!(authenticate: "api_key")).dispatch();
    client
}

pub trait ResponseOperations {
    fn entity(&mut self) -> (Status, String);
}

impl<'c> ResponseOperations for LocalResponse<'c> {
    fn entity(&mut self) -> (Status, String) {
        (
            self.status(),
            self.body_string().expect("Response body is empty"),
        )
    }
}

pub trait ClientOperations {
    fn get_uri(&self, uri: Origin) -> LocalRequest;

    fn delete_uri(&self, uri: Origin) -> LocalRequest;

    fn post_uri(&self, uri: Origin) -> LocalRequest;
}

impl ClientOperations for Client {
    fn get_uri(&self, uri: Origin) -> LocalRequest {
        self.get(uri.to_string())
    }

    fn delete_uri(&self, uri: Origin) -> LocalRequest {
        self.delete(uri.to_string())
    }

    fn post_uri(&self, uri: Origin) -> LocalRequest {
        self.post(uri.to_string())
    }
}

pub fn api_response<T>(status: Status, entity: T) -> (Status, String)
where
    T: serde::Serialize,
{
    let api_response = ApiResponse::with(entity);
    let api_response_string =
        serde_json::to_string(&api_response).expect("Failed to serialize api response.");
    (status, api_response_string)
}

pub fn api_ok<T>(entity: T) -> (Status, String)
where
    T: serde::Serialize,
{
    api_response(Status::Ok, entity)
}

pub fn api_error(status: Status, message: &str) -> (Status, String) {
    let api_error = ApiError::with(message.to_string());
    let api_error_string =
        serde_json::to_string(&api_error).expect("Failed to serialize api error.");
    (status, api_error_string)
}
