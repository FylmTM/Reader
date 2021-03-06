#![allow(dead_code)]

use rocket::http::Status;
use rocket::local::{Client, LocalRequest, LocalResponse};

use reader;
use reader::api::routes::*;
use reader::api::{ApiError, ApiResponse};

pub fn get() -> Client {
    crate::common::mock_server::start();
    let app = reader::app(true);
    let client = Client::new(app).expect("failed to construct rocket client");
    client
}

pub fn authenticated() -> Client {
    let client = get();
    client
        .post("/api/v1/auth/login")
        .json(ApiKey {
            api_key: "api_key".to_string(),
        })
        .dispatch();

    let feeds_update_status = client.get("/api/v1/feeds/update").dispatch().status().code;
    assert_eq!(feeds_update_status, 200);

    client
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
    fn json_entity(&mut self) -> (String, serde_json::Value);
}

impl<'c> ResponseOperations for LocalResponse<'c> {
    fn entity(&mut self) -> (Status, String) {
        (
            self.status(),
            self.body_string().expect("Response body is empty"),
        )
    }

    fn json_entity(&mut self) -> (String, serde_json::Value) {
        let body = self.body_string().expect("Response body is empty");
        let value: serde_json::Value =
            serde_json::from_str(&body).expect("Failed to deserialize body");
        (self.status().to_string(), value)
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
