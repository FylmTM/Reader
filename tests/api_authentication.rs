#![feature(proc_macro_hygiene, decl_macro)]

use reader::api::endpoints::*;
use rocket::http::Status;
use rocket::uri;

mod common;

#[test]
fn test_authentication_success() {
    let client = common::client();
    let mut response = client
        .get(uri!(authenticate: "api_key").to_string())
        .dispatch();

    assert_eq!(
        (response.status(), response.body_string()),
        (
            Status::Ok,
            Some("{\"status\":\"ok\",\"payload\":{\"id\":1,\"username\":\"me\"}}".to_string())
        )
    );
    assert_eq!(response.cookies().len(), 1);
}

#[test]
fn test_authentication_failed() {
    let client = common::client();
    let mut response = client
        .get(uri!(authenticate: "invalid_api_key").to_string())
        .dispatch();

    assert_eq!(
        (response.status(), response.body_string()),
        (
            Status::NotFound,
            Some("{\"error\":\"Entity not found.\",\"status\":\"error\"}".to_string())
        )
    );
    assert_eq!(response.cookies().len(), 0);
}
