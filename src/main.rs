#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use]
extern crate rocket;
#[macro_use]
extern crate rocket_contrib;
#[macro_use]
extern crate serde_derive;

use rocket_contrib::databases::diesel;
use rocket_contrib::json::{Json, JsonValue};

#[database("db")]
struct Database(diesel::SqliteConnection);

#[derive(Serialize, Deserialize)]
struct Post {
    title: String
}

#[get("/")]
fn index() -> Json<Post> {
    Json(Post {
        title: "hello".to_string()
    })
}

#[catch(404)]
fn not_found() -> JsonValue {
    json!({
        "status": "ok",
        "error": "Not found."
    })
}

fn main() {
    rocket::ignite()
        .mount("/", routes!(
            index
        ))
        .register(catchers![not_found])
        .attach(Database::fairing())
        .launch();
}
