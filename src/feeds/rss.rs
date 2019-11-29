use crate::db;
use std::thread;
use std::time::Duration;

pub fn update(_conn: &db::Connection) {
    thread::sleep(Duration::from_secs(5));
}
