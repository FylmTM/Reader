use rusqlite::Connection;
use std::thread;
use std::time::Duration;

pub fn update(_conn: &Connection) {
    thread::sleep(Duration::from_secs(5));
}
