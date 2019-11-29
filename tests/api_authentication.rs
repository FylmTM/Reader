#![feature(proc_macro_hygiene, decl_macro)]

mod common;

use common::{api_error, api_response, ClientOperations, ResponseOperations};
use reader::api::endpoints::*;
use reader::db::User;
use rocket::http::Status;
use rocket::uri;

#[test]
fn test_authentication_success() {
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
fn test_authentication_failed() {
    let client = common::client();
    let mut response = client.get_uri(uri!(authenticate: "invalid")).dispatch();

    let expected_response = api_error(Status::NotFound, "Entity not found.");
    assert_eq!(response.entity(), expected_response);
}
