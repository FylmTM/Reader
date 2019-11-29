#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use]
extern crate log;
extern crate r2d2;
extern crate r2d2_sqlite;
#[macro_use]
extern crate rocket;
extern crate rusqlite;
#[macro_use]
extern crate serde_derive;
extern crate time;

pub mod api;
pub mod db;
pub mod error;
pub mod feeds;

pub fn app(is_testing: bool) -> rocket::Rocket {
    if !is_testing {
        let mut log = env_logger::Builder::from_default_env();
        log.target(env_logger::Target::Stderr)
            .filter_level(log::LevelFilter::Info)
            .init();
    }

    info!("Start Reader.");
    let rocket = rocket::ignite();
    let config = rocket.config();

    //-----------------
    // Configuration
    //-----------------

    let mut db_in_memory = config.get_bool("db_in_memory").unwrap_or(false);
    let db_path = config.get_str("db_path").unwrap_or("db.sqlite");
    let mut db_pool_size = config.get_int("db_pool_size").unwrap_or(10) as u32;
    let mut feeds_update_enabled = config.get_bool("feeds_update_enabled").unwrap_or(true);
    let feeds_update_interval = config.get_int("feeds_update_interval").unwrap_or(30) as u64;
    let mut dev_db_fixture_enabled = config.get_bool("dev_db_fixture_enabled").unwrap_or(false);

    if is_testing {
        db_in_memory = true; // Do not store database on disk.
        db_pool_size = 1; // Database are managed per-connection, so we must use only 1 connection.
        feeds_update_enabled = false; // We don't want feeds updater in tests.
        dev_db_fixture_enabled = true; // Tests depends on fixture data.
    }

    //-----------------
    // Database
    //-----------------

    let manager = if db_in_memory {
        info!("Create in memory db[pool_size={}].", db_pool_size);
        r2d2_sqlite::SqliteConnectionManager::memory()
    } else {
        info!("Create db[path={}, pool_size={}].", db_path, db_pool_size);
        r2d2_sqlite::SqliteConnectionManager::file(db_path)
    };
    let pool = r2d2::Pool::builder()
        .max_size(db_pool_size)
        .build(manager)
        .unwrap();
    let connection = pool.get().expect("Failed to acquire connection.");
    db::bootstrap::initialize_schema(&connection);

    if dev_db_fixture_enabled {
        info!("Apply development db fixture.");
        db::bootstrap::initialize_fixture(&connection);
    }

    //-----------------
    // Feeds updater
    //-----------------

    if feeds_update_enabled {
        feeds::initialize(&pool, feeds_update_interval);
    } else {
        info!("Feeds updater is disabled.")
    }

    //-----------------
    // Server
    //-----------------

    info!("Start server.");
    rocket
        .manage(pool)
        .register(catchers![
            api::catchers::catcher_unauthorized,
            api::catchers::catcher_not_found,
            api::catchers::catcher_internal_error,
        ])
        .mount(
            "/",
            routes![api::endpoints::authenticate, api::endpoints::current_user],
        )
}