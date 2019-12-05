#![allow(dead_code)]

use rocket::http::uri::Origin;
use rocket::http::Status;
use rocket::local::{Client, LocalRequest, LocalResponse};
use rocket::uri;

use reader;
use reader::api::routes::*;
use reader::api::{ApiError, ApiResponse};

pub fn get() -> Client {
    let app = reader::app(true);
    Client::new(app).expect("failed to construct rocket client")
}

pub fn authenticated() -> Client {
    let app = reader::app(true);
    let client = Client::new(app).expect("failed to construct rocket client");
    client
        .post_uri(uri!(authenticate))
        .json(ApiKey {
            api_key: "api_key".to_string(),
        })
        .dispatch();
    client
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

pub trait RequestOperations {
    fn json<T>(self, body: T) -> Self
    where
        T: serde::Serialize;
}

impl<'c> RequestOperations for LocalRequest<'c> {
    fn json<T>(self, body: T) -> Self
    where
        T: serde::Serialize,
    {
        self.header(rocket::http::ContentType::JSON)
            .body(serde_json::to_string(&body).unwrap())
    }
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

pub fn api_response<T>(status: Status, entity: T) -> (Status, String)
where
    T: serde::Serialize,
{
    let api_response = ApiResponse::with(entity);
    let api_response_string = serde_json::to_string(&api_response).unwrap();
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