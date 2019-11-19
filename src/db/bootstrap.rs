use rusqlite::Connection;

pub fn initialize_schema(conn: &Connection) {
    conn.execute_batch(include_str!("queries/bootstrap/V1_initial.sql"))
        .expect("Schema creation failed.")
}

pub fn initialize_fixture(conn: &Connection) {
    conn.execute_batch(include_str!("queries/bootstrap/fixture.sql"))
        .expect("Fixture failed to apply.");
}
