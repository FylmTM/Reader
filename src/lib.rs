#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use]
extern crate log;
extern crate r2d2;
extern crate r2d2_sqlite;
#[macro_use]
extern crate rocket;
extern crate rusqlite;
#[macro_use]
extern crate rust_embed;
#[macro_use]
extern crate serde_derive;
extern crate ammonia;
extern crate time;
#[macro_use]
extern crate lazy_static;
#[cfg(test)]
#[macro_use]
extern crate insta;
extern crate regex;

pub mod api;
pub mod db;
pub mod error;
pub mod feeds;

pub fn app(is_testing: bool) -> rocket::Rocket {
    std::env::set_var("ROCKET_CLI_COLORS", "off");
    if !is_testing {
        let mut log = env_logger::Builder::from_default_env();
        log.target(env_logger::Target::Stdout);
        if std::env::var_os("RUST_LOG").is_none() {
            log.filter_level(log::LevelFilter::Info);
        }
        log.init();
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
    let feeds_update_interval = config.get_int("feeds_update_interval").unwrap_or(10) as u64;
    let load_fixture = config.get_bool("load_fixture").unwrap_or(true);

    if is_testing {
        db_in_memory = true; // Do not store database on disk.
        db_pool_size = 1; // Database are managed per-connection, so we must use only 1 connection.
        feeds_update_enabled = false; // We don't want feeds updater in tests.
    }

    //-----------------
    // Database
    //-----------------

    let manager = if db_in_memory {
        info!("Create db [path=:memory:, pool_size={}].", db_pool_size);
        r2d2_sqlite::SqliteConnectionManager::memory()
    } else {
        info!("Create db [path={}, pool_size={}].", db_path, db_pool_size);
        r2d2_sqlite::SqliteConnectionManager::file(db_path)
    };
    let pool = r2d2::Pool::builder()
        .max_size(db_pool_size)
        .build(manager)
        .unwrap();
    let conn = pool.get().expect("Failed to acquire connection.");
    db::bootstrap::initialize_schema(&conn);

    if load_fixture {
        info!("Apply fixture.");
        db::bootstrap::load_fixture(&conn);
    }

    //-----------------
    // Server
    //-----------------

    info!("Start server.");
    rocket
        .manage(pool)
        .attach(
            rocket_contrib::helmet::SpaceHelmet::default()
                .enable(rocket_contrib::helmet::Referrer::NoReferrer),
        )
        .attach(rocket::fairing::AdHoc::on_response(
            "Configure Content-Security-Policy",
            |_, res| {
                res.set_raw_header(
                    "Content-Security-Policy",
                    "default-src 'none'; script-src 'self' 'unsafe-inline'; connect-src 'self'; img-src *; style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; font-src 'self' https://fonts.gstatic.com",
                );
            },
        ))
        .attach(rocket::fairing::AdHoc::on_launch("Feeds update", move |rocket| {
            //-----------------
            // Feeds updater
            //-----------------
            if feeds_update_enabled {
                let pool = rocket.state::<db::Pool>().expect("State must be present");
                feeds::initialize(&pool.clone(), feeds_update_interval);
            } else {
                info!("Feeds updater is disabled.");
            }
        }))
        .register(catchers![
            api::catchers::catcher_unauthorized,
            api::catchers::catcher_not_found,
            api::catchers::catcher_internal_error,
        ])
        .mount(
            "/",
            routes![
                api::routes::feeds_update,
                api::routes::auth_login,
                api::routes::auth_logout,
                api::routes::current_user,
                api::routes::categories_with_feeds,
                api::routes::posts,
                api::routes::posts_unread_count,
                api::routes::post_content,
                api::routes::post_is_read,
                api::routes::post_is_read_later,
                api::assets::index,
                api::assets::assets
            ],
        )
}
