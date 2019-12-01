#![feature(proc_macro_hygiene, decl_macro)]

pub mod common;

use crate::common::api_ok;
use common::{api_error, api_response, ClientOperations, ResponseOperations};
use reader::api::endpoints::*;
use reader::db::User;
use rocket::http::Status;
use rocket::uri;

#[test]
fn test_authenticate_failed() {
    let client = common::client();
    let mut response = client.get_uri(uri!(authenticate: "invalid")).dispatch();

    let expected_response = api_error(Status::NotFound, "Entity not found.");
    assert_eq!(response.entity(), expected_response);
}

#[test]
fn test_authenticate_success() {
    let client = common::client();
    let mut response = client.get_uri(uri!(authenticate: "api_key")).dispatch();

    let expected_response = api_response(
        Status::Ok,
        User {
            id: 1,
            username: "me".to_string(),
        },
    );
    assert_eq!(response.entity(), expected_response);
    assert_eq!(response.cookies().len(), 1);
}

#[test]
fn test_get_current_user_failed_if_not_authenticated() {
    let client = common::client();
    let mut response = client.get_uri(uri!(current_user)).dispatch();

    let expected_response = api_error(Status::Unauthorized, "Unauthorized.");
    assert_eq!(response.entity(), expected_response);
}

#[test]
fn test_get_current_user() {
    let client = common::authenticated_client();
    let mut response = client.get_uri(uri!(current_user)).dispatch();

    let expected_response = api_ok(User {
        id: 1,
        username: "me".to_string(),
    });
    assert_eq!(response.entity(), expected_response);
}
