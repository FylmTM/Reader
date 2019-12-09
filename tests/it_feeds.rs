#![feature(proc_macro_hygiene, decl_macro)]
#[macro_use]
extern crate rocket;

use reader::db::Queries;
use reader::feeds::rss;

pub mod common;

const USER_ID: i64 = 1;
const CATEGORY_ID: i64 = 1;
const RSS_FEED_ID: i64 = 1;

#[test]
fn test_rss_update() {
    common::mock_server::test(|| {
        let mut conn = common::db();
        let feed = conn.find_feed(RSS_FEED_ID).unwrap();

        // Should be empty
        assert_eq!(conn.count_posts_by_user(USER_ID).unwrap(), 0);
        assert_eq!(conn.count_posts_by_category(CATEGORY_ID).unwrap(), 0);
        assert_eq!(conn.count_posts_by_feed(RSS_FEED_ID).unwrap(), 0);

        rss::update(&mut conn, &feed).unwrap();

        // All posts should be present
        assert_eq!(conn.count_posts_by_user(USER_ID).unwrap(), 30);
        assert_eq!(conn.count_posts_by_category(CATEGORY_ID).unwrap(), 30);
        assert_eq!(conn.count_posts_by_feed(RSS_FEED_ID).unwrap(), 30);

        rss::update(&mut conn, &feed).unwrap();

        // All posts already present, no more should be added
        assert_eq!(conn.count_posts_by_user(USER_ID).unwrap(), 30);
        assert_eq!(conn.count_posts_by_category(CATEGORY_ID).unwrap(), 30);
        assert_eq!(conn.count_posts_by_feed(RSS_FEED_ID).unwrap(), 30);
    });
}
