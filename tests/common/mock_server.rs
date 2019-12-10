#![allow(dead_code)]

use reader::api;

static START_ASSETS_SERVER: std::sync::Once = std::sync::Once::new();

pub fn start() {
    START_ASSETS_SERVER.call_once(|| {
        std::thread::spawn(|| {
            let mut log = env_logger::Builder::from_default_env();
            log.filter_level(log::LevelFilter::Off);
            log.init();

            let config = rocket::config::Config::build(rocket::config::Environment::Development)
                .address("0.0.0.0")
                .port(8080)
                .log_level(rocket::logger::LoggingLevel::Off)
                .finalize()
                .expect("Failed to create rocket config.");

            rocket::custom(config)
                .mount("/", routes![api::assets::assets])
                .launch();
        });
    });
}
