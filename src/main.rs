#![feature(proc_macro_hygiene, decl_macro)]

extern crate r2d2;
extern crate r2d2_sqlite;
#[macro_use]
extern crate rocket;
#[macro_use]
extern crate rocket_contrib;
extern crate rusqlite;
#[macro_use]
extern crate serde_derive;

use r2d2_sqlite::SqliteConnectionManager;

mod api;
mod bootstrap;
mod db;
mod error;

fn main() {
    let rocket = rocket::ignite();
    let config = rocket.config();

    let db_path = config.get_str("db_path").unwrap_or("db.sqlite");
    let db_pool_size = config.get_int("db_pool_size").unwrap_or(10) as u32;

    let manager = SqliteConnectionManager::file(db_path);
    let pool = r2d2::Pool::builder()
        .max_size(db_pool_size)
        .build(manager)
        .unwrap();

    let connection = pool.get().expect("Failed to acquire connection");
    db::initialize(&connection);

    rocket
        .manage(bootstrap::Context { pool })
        .register(catchers![
            bootstrap::catcher_not_found,
            bootstrap::catcher_internal_error
        ])
        .mount("/", routes!(api::endpoints::index))
        .launch();
}
