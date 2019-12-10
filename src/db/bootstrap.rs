use rusqlite::{Connection, NO_PARAMS};

const SCHEMA_VERSION: u16 = 1;

/// # Database schema
///
/// This is really dumb & simple implementation of schema migrations.
///
/// It defines a `schema_version` table that contains one row, which defines current schema version.
/// During initialization it will read current version (or initialize version 0) from database.
/// If current version is less that required version, it will sequentially apply all missing migrations,
/// and then update `schema_version`.
pub fn initialize_schema(conn: &Connection) {
    conn.execute_batch(include_str!("migrations/schema_version.sql"))
        .expect("Failed to create schema_version table.");

    let mut current_version: u16 = conn
        .query_row(
            // language=SQLite
            "select version from schema_version",
            NO_PARAMS,
            |row| row.get(0),
        )
        .expect("Failed to retrieve current schema version.");

    let version_before = current_version;

    info!(
        "Current schema version=V{}, required=V{}.",
        current_version, SCHEMA_VERSION
    );

    if current_version == 0 {
        info!("Applying V1 migration.");
        conn.execute_batch(include_str!("migrations/V1_initial.sql"))
            .expect("Schema creation failed.");
        current_version = 1;
    }

    if version_before != current_version {
        info!("Set current schema version to V{}.", current_version);
        conn.execute(
            // language=SQLite
            "update schema_version set version = ? where id = 1",
            &[current_version],
        )
        .expect("Failed to update current schema version.");
    }
}

/// # Database fixture
///
/// If applied, will insert sample data into a database.
/// Useful for development purposes.
pub fn load_fixture(conn: &Connection) {
    let fixture = std::fs::read_to_string("fixture.sql").expect("Failed to load fixture.sql");
    println!("{}", fixture);
    conn.execute_batch(&fixture)
        .expect("Failed to apply fixture.");
}
