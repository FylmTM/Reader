#![allow(dead_code)]

pub mod client;
pub mod mock_server;

use reader::db;

pub fn db() -> db::Connection {
    let conn = db::Connection::open_in_memory().unwrap();

    db::bootstrap::initialize_schema(&conn);
    conn.execute_batch(include_str!("test_assets/test_fixture.sql"))
        .expect("Failed to apply fixture.");

    conn
}
