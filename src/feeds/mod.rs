use crate::bootstrap::DBPool;
use rusqlite::Connection;
use std::thread;
use std::time::Duration;

mod rss;
mod twitter;

pub fn initialize(config: &rocket::Config, pool: &DBPool) {
    schedule("RSS", "rss_update_interval", rss::update, config, pool);
    schedule(
        "Twitter",
        "twitter_update_interval",
        twitter::update,
        config,
        pool,
    );
}

fn schedule(
    name: &'static str,
    config_parameter: &'static str,
    updater: fn(&Connection) -> (),
    config: &rocket::Config,
    pool: &DBPool,
) {
    let interval = config.get_int(config_parameter).unwrap_or(30) as u64;
    let pool = pool.clone();
    thread::spawn(move || {
        info!("Schedule {} feeds update every {} minutes.", name, interval);
        loop {
            info!("Update {} feeds.", name);
            let conn = pool.get().expect("Failed to acquire DB connection");
            updater(&conn);
            info!(
                "{} feeds update completed. Next one in {} minutes.",
                name, interval
            );
            thread::sleep(Duration::from_secs(60 * interval));
        }
    });
}
