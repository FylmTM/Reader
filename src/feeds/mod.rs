use std::thread;
use std::time::Duration;

use rusqlite::Connection;

use crate::bootstrap::DBPool;

mod rss;

pub fn initialize(config: &rocket::Config, pool: &DBPool) {
    let interval = config.get_int("feeds_update_interval").unwrap_or(30) as u64;
    let pool = pool.clone();

    info!("Schedule feeds update every {} minutes.", interval);

    thread::spawn(move || loop {
        loop {
            info!("Begin feeds update.");
            let conn = pool.get().expect("Failed to acquire DB connection");
            run("RSS", rss::update, &conn);

            info!("Feeds update completed. Next one in {} minutes.", interval);
            thread::sleep(Duration::from_secs(60 * interval));
        }
    });
}

fn run(name: &'static str, updater: fn(&Connection) -> (), conn: &Connection) {
    info!("Update {} feeds.", name);
    updater(&conn);
    info!("{} feeds update completed.", name);
}
