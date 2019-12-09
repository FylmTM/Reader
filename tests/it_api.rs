#![feature(proc_macro_hygiene, decl_macro)]
#[macro_use]
extern crate rocket;

#[macro_use]
extern crate insta;

use rocket::uri;

use common::client::{self, ClientOperations, RequestOperations, ResponseOperations};
use reader::api::routes::*;
use reader::db;

pub mod common;

#[test]
fn test_auth_login_failed() {
    let client = client::get();
    let mut response = client
        .post_uri(uri!(auth_login))
        .json(ApiKey {
            api_key: "invalid".to_string(),
        })
        .dispatch();

    assert_json_snapshot!(response.json_entity())
}

#[test]
fn test_auth_login_success() {
    let client = client::get();
    let mut response = client
        .post_uri(uri!(auth_login))
        .json(ApiKey {
            api_key: "api_key".to_string(),
        })
        .dispatch();

    assert_json_snapshot!(response.json_entity());
    assert_eq!(response.cookies().len(), 1);
}

#[test]
fn test_auth_logout_success() {
    let client = client::authenticated();

    let mut response = client.post_uri(uri!(auth_logout)).dispatch();
    assert_eq!(response.entity(), client::api_ok(()));
    assert_eq!(response.cookies().len(), 1);

    let mut response = client.get_uri(uri!(current_user)).dispatch();
    assert_json_snapshot!(response.json_entity());
}

#[test]
fn test_get_current_user_failed_if_not_authenticated() {
    let client = client::get();

    let mut response = client.get_uri(uri!(current_user)).dispatch();
    assert_json_snapshot!(response.json_entity());
}

#[test]
fn test_get_current_user() {
    let client = client::authenticated();

    let mut response = client.get_uri(uri!(current_user)).dispatch();
    assert_json_snapshot!(response.json_entity());
}

#[test]
fn test_get_categories_with_feeds() {
    let client = client::authenticated();

    let mut response = client.get_uri(uri!(categories_with_feeds)).dispatch();
    assert_json_snapshot!(response.json_entity());
}
