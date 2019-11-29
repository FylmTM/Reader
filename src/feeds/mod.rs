use std::thread;
use std::time::Duration;

use crate::db;

mod rss;

pub fn initialize(pool: &db::Pool, interval: u64) {
    let pool = pool.clone();
    info!("Schedule feeds update every {} minutes.", interval);

    thread::spawn(move || loop {
        loop {
            info!("Feeds update started.");
            let conn = pool.clone().get().expect("Failed to acquire db connection");
            run("RSS", rss::update, &conn);

            info!("Feeds update completed. Next in {} minutes.", interval);
            thread::sleep(Duration::from_secs(60 * interval));
        }
    });
}

fn run(name: &'static str, updater: fn(&db::Connection) -> (), conn: &db::Connection) {
    info!("{} feeds update started.", name);
    updater(&conn);
    info!("{} feeds update completed.", name);
}
