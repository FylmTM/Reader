#![allow(dead_code)]

#[get("/rss/hacker_news.xml")]
fn route_rss_feed() -> &'static str {
    include_str!("test_assets/rss_hacker_news.xml")
}

static START_ASSETS_SERVER: std::sync::Once = std::sync::Once::new();

pub fn test<F>(test: F)
where
    F: FnOnce() + Send + 'static,
{
    START_ASSETS_SERVER.call_once(|| {
        std::thread::spawn(|| {
            let config = rocket::config::Config::build(rocket::config::Environment::Development)
                .address("0.0.0.0")
                .port(18080)
                .log_level(rocket::logger::LoggingLevel::Off)
                .finalize()
                .expect("Failed to create rocket config.");

            rocket::custom(config)
                .mount("/", routes![route_rss_feed])
                .launch();
        });
    });
    test();
}
