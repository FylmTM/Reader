#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use]
extern crate rocket;

use reader::db;
use reader::feeds::rss;

pub mod common;

const USER_ID: i64 = 1;
const RSS_FEED_ID: i64 = 1;

#[test]
fn test_rss_update() {
    with_assets(|| {
        let conn = common::db();

        assert_eq!(db::count_posts_by_feed(&conn, RSS_FEED_ID).unwrap(), 0);
        assert_eq!(db::count_posts_by_user(&conn, USER_ID).unwrap(), 0);

        let feed = db::find_feed_by_id(&conn, RSS_FEED_ID).unwrap();
        rss::update(&conn, &feed).unwrap();

        assert_eq!(db::count_posts_by_feed(&conn, RSS_FEED_ID).unwrap(), 30);
        assert_eq!(db::count_posts_by_user(&conn, USER_ID).unwrap(), 30);
    });
}

#[get("/rss_feed.xml")]
fn route_rss_feed() -> &'static str {
    include_str!("test_assets/rss_feed.xml")
}

static START_ASSETS_SERVER: std::sync::Once = std::sync::Once::new();

fn with_assets<F>(test: F)
where
    F: FnOnce() + Send + 'static,
{
    START_ASSETS_SERVER.call_once(|| {
        std::thread::spawn(|| {
            let config = rocket::config::Config::build(rocket::config::Environment::Development)
                .address("0.0.0.0")
                .port(18080)
                .finalize()
                .expect("Failed to create rocket config.");

            rocket::custom(config)
                .mount("/", routes![route_rss_feed])
                .launch();
        });
    });
    test();
}
