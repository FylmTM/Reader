#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use]
extern crate log;
extern crate r2d2;
extern crate r2d2_sqlite;
#[macro_use]
extern crate rocket;
#[macro_use]
extern crate rocket_contrib;
extern crate rusqlite;
#[macro_use]
extern crate serde_derive;

mod api;
mod bootstrap;
mod db;
mod error;

fn main() {
    let mut log = env_logger::Builder::from_default_env();
    log.target(env_logger::Target::Stdout)
        .filter_level(log::LevelFilter::Info)
        .init();

    info!("Start Reader.");
    let rocket = rocket::ignite();
    let config = rocket.config();

    let db_path = config.get_str("db_path").unwrap_or("db.sqlite");
    let db_pool_size = config.get_int("db_pool_size").unwrap_or(10) as u32;

    info!("Initialize database pool.");
    let manager = r2d2_sqlite::SqliteConnectionManager::file(db_path);
    let pool = r2d2::Pool::builder()
        .max_size(db_pool_size)
        .build(manager)
        .unwrap();

    info!("Initialize database schema.");
    let connection = pool.get().expect("Failed to acquire connection");
    db::initialize(&connection);

    info!("Start server.");
    rocket
        .manage(bootstrap::Context { pool })
        .register(catchers![
            bootstrap::catcher_not_found,
            bootstrap::catcher_internal_error
        ])
        .mount("/", routes!(api::endpoints::index))
        .launch();
}
