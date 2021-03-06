#![feature(proc_macro_hygiene, decl_macro)]
#[macro_use]
extern crate rocket;

#[macro_use]
extern crate insta;

use crate::common::client::api_ok;
use common::client::{self, RequestOperations, ResponseOperations};
use reader::api::routes::*;

pub mod common;

#[test]
fn test_auth_login_failed() {
    let client = client::get();
    let mut response = client
        .post("/api/v1/auth/login")
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
        .post("/api/v1/auth/login")
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

    let mut response = client.post("/api/v1/auth/logout").dispatch();
    assert_eq!(response.entity(), client::api_ok(()));
    assert_eq!(response.cookies().len(), 1);

    let mut response = client.get("/api/v1/auth/current_user").dispatch();
    assert_json_snapshot!(response.json_entity());
}

#[test]
fn test_get_current_user_failed_if_not_authenticated() {
    let client = client::get();

    let mut response = client.get("/api/v1/auth/current_user").dispatch();
    assert_json_snapshot!(response.json_entity());
}

#[test]
fn test_get_current_user() {
    let client = client::authenticated();

    let mut response = client.get("/api/v1/auth/current_user").dispatch();
    assert_json_snapshot!(response.json_entity());
}

#[test]
fn test_get_categories_with_feeds() {
    let client = client::authenticated();

    let mut response = client.get("/api/v1/categories_with_feeds").dispatch();
    assert_json_snapshot!(response.json_entity());
}

#[test]
fn test_get_posts_all() {
    let client = client::authenticated();

    let mut response = client.get("/api/v1/posts").dispatch();
    assert_json_snapshot!(response.json_entity());
}

#[test]
fn test_get_posts_all_from_post_id() {
    let client = client::authenticated();

    let mut response = client.get("/api/v1/posts?from_post_id=10").dispatch();
    assert_json_snapshot!(response.json_entity());
}

#[test]
fn test_get_posts_read_later() {
    let client = client::authenticated();

    let mut response = client.get("/api/v1/posts?is_read_later=true").dispatch();
    assert_json_snapshot!(response.json_entity());
}

#[test]
fn test_get_posts_category() {
    let client = client::authenticated();

    let mut response = client.get("/api/v1/posts?category_id=1").dispatch();
    assert_json_snapshot!(response.json_entity());
}

#[test]
fn test_get_posts_feed() {
    let client = client::authenticated();

    let mut response = client.get("/api/v1/posts?feed_id=1").dispatch();
    assert_json_snapshot!(response.json_entity());
}

#[test]
fn test_posts_all_mark_as_read() {
    let client = client::authenticated();

    let mut response = client
        .get("/api/v1/posts/mark_as_read?from_post_id=10000")
        .dispatch();
    assert_eq!(api_ok(()), response.entity());

    let mut response = client.get("/api/v1/posts/unread_count").dispatch();
    assert_json_snapshot!(response.json_entity());
}

#[test]
fn test_posts_all_mark_as_read_last_10() {
    let client = client::authenticated();

    let mut response = client
        .get("/api/v1/posts/mark_as_read?from_post_id=10")
        .dispatch();
    assert_eq!(api_ok(()), response.entity());

    let mut response = client.get("/api/v1/posts/unread_count").dispatch();
    assert_json_snapshot!(response.json_entity());
}

#[test]
fn test_posts_category_mark_as_read() {
    let client = client::authenticated();

    let mut response = client
        .get("/api/v1/posts/mark_as_read?from_post_id=10000&category_id=1")
        .dispatch();
    assert_eq!(api_ok(()), response.entity());

    let mut response = client.get("/api/v1/posts/unread_count").dispatch();
    assert_json_snapshot!(response.json_entity());
}

#[test]
fn test_posts_feed_mark_as_read() {
    let client = client::authenticated();

    let mut response = client
        .get("/api/v1/posts/mark_as_read?from_post_id=10000&feed_id=1")
        .dispatch();
    assert_eq!(api_ok(()), response.entity());

    let mut response = client.get("/api/v1/posts/unread_count").dispatch();
    assert_json_snapshot!(response.json_entity());
}

#[test]
fn test_get_posts_unread_count() {
    let client = client::authenticated();

    let mut response = client.get("/api/v1/posts/unread_count").dispatch();
    assert_json_snapshot!(response.json_entity());
}

#[test]
fn test_get_post_content() {
    let client = client::authenticated();

    let mut response = client.get("/api/v1/posts/1/content").dispatch();
    assert_json_snapshot!(response.json_entity());
}

#[test]
fn test_toggle_post_is_read() {
    let client = client::authenticated();

    let mut response = client.get("/api/v1/posts/unread_count").dispatch();
    assert_json_snapshot!(
        "post_is_read__get_unread_count_before",
        response.json_entity()
    );

    let mut response = client
        .post("/api/v1/posts/1/is_read")
        .json(PostIsReadData { is_read: true })
        .dispatch();
    assert_eq!(api_ok(()), response.entity());

    let mut response = client.get("/api/v1/posts/unread_count").dispatch();
    assert_json_snapshot!(
        "post_is_read__get_unread_count_after",
        response.json_entity()
    );

    let mut response = client
        .post("/api/v1/posts/1/is_read")
        .json(PostIsReadData { is_read: false })
        .dispatch();
    assert_eq!(api_ok(()), response.entity());

    let mut response = client.get("/api/v1/posts/unread_count").dispatch();
    assert_json_snapshot!(
        "post_is_read__get_unread_count_before",
        response.json_entity()
    );
}

#[test]
fn test_toggle_post_is_read_later() {
    let client = client::authenticated();

    let mut response = client.get("/api/v1/posts?is_read_later=true").dispatch();
    assert_json_snapshot!(
        "post_is_read_later__get_posts_before",
        response.json_entity()
    );

    let mut response = client
        .post("/api/v1/posts/1/is_read_later")
        .json(PostIsReadLaterData {
            is_read_later: true,
        })
        .dispatch();
    assert_eq!(api_ok(()), response.entity());

    let mut response = client.get("/api/v1/posts?is_read_later=true").dispatch();
    assert_json_snapshot!(
        "post_is_read_later__get_posts_after",
        response.json_entity()
    );

    let mut response = client
        .post("/api/v1/posts/1/is_read_later")
        .json(PostIsReadLaterData {
            is_read_later: false,
        })
        .dispatch();
    assert_eq!(api_ok(()), response.entity());

    let mut response = client.get("/api/v1/posts?is_read_later=true").dispatch();
    assert_json_snapshot!(
        "post_is_read_later__get_posts_before",
        response.json_entity()
    );
}
