#![feature(proc_macro_hygiene, decl_macro)]
#[macro_use]
extern crate rocket;
#[macro_use]
extern crate insta;

use reader::db::Queries;
use reader::feeds;

pub mod common;

const USER_ID: i64 = 1;
const RSS_HACKER_NEWS_ID: i64 = 1;

#[test]
fn test_rss_update() {
    common::mock_server::start();

    let mut conn = common::db();
    let feed = conn.find_feed(RSS_HACKER_NEWS_ID).unwrap();

    // Empty
    assert_json_snapshot!(
        "rss_update_before",
        conn.find_posts(USER_ID, None, None, None, None, Some(RSS_HACKER_NEWS_ID))
            .unwrap()
    );

    // Updated
    feeds::update_feed(&mut conn, &feed).unwrap();
    assert_json_snapshot!(
        "rss_update_after",
        conn.find_posts(USER_ID, None, None, None, None, Some(RSS_HACKER_NEWS_ID))
            .unwrap()
    );

    // No changes
    feeds::update_feed(&mut conn, &feed).unwrap();
    assert_json_snapshot!(
        "rss_update_after",
        conn.find_posts(USER_ID, None, None, None, None, Some(RSS_HACKER_NEWS_ID))
            .unwrap()
    );
}
