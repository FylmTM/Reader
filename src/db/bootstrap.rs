use rusqlite::{Connection, NO_PARAMS};

const SCHEMA_VERSION: u16 = 1;
// language=SQLite
const SCHEMA_VERSION_QUERY: &str = "
create table if not exists schema_version
(
    id      integer primary key,
    version integer
);

insert or ignore into schema_version(id, version)
values (1, 0);
";

pub fn initialize_schema(conn: &Connection) {
    conn.execute_batch(SCHEMA_VERSION_QUERY)
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

pub fn initialize_fixture(conn: &Connection) {
    // language=SQLite
    let query = "
        insert or ignore into users(id, username, api_key)
        values (1, 'me', 'api_key');
    ";
    conn.execute_batch(query).expect("Failed to apply fixture.");
}
