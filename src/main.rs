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

use std::io::Cursor;

use r2d2_sqlite::SqliteConnectionManager;
use rocket::{Request, Response, State};
use rocket::response::Responder;
use rocket_contrib::json::{Json, JsonValue};
use rusqlite::{Connection, Error as SqliteError, NO_PARAMS, params};

pub struct Context {
    pub pool: r2d2::Pool<r2d2_sqlite::SqliteConnectionManager>,
}

#[derive(Serialize, Deserialize)]
struct ApiResponse<T> {
    status: String,
    payload: T,
}

impl <T> ApiResponse<T> {
    fn with(payload: T) -> ApiResponse<T> {
        ApiResponse {
            status: "ok".to_string(),
            payload,
        }
    }
}

#[derive(Debug)]
pub enum ApiError {
    PoolError(r2d2::Error),
    DatabaseError(SqliteError),
}

impl From<SqliteError> for ApiError {
    fn from(error: SqliteError) -> ApiError {
        ApiError::DatabaseError(error)
    }
}

impl From<r2d2::Error> for ApiError {
    fn from(error: r2d2::Error) -> ApiError {
        ApiError::PoolError(error)
    }
}

impl<'r> Responder<'r> for ApiError {
    fn respond_to(self, _: &Request) -> Result<Response<'r>, rocket::http::Status> {
        let message = format!("{:?}", self);
        let json = json!({
            "status": "error",
            "error": message
        });
        Response::build()
            .header(rocket::http::ContentType::JSON)
            .sized_body(Cursor::new(json.0.to_string()))
            .status(rocket::http::Status::InternalServerError)
            .ok()
    }
}

#[derive(Serialize, Deserialize)]
struct Post {
    id: i64,
    title: String,
    body: String,
}

fn load_from_db(conn: &Connection) -> Result<Vec<Post>, ApiError> {
    let mut statement = conn.prepare("SELECT id, title, body FROM posts")?;
    let posts_iter = statement
        .query_map(params![], |row| {
            Ok(Post {
                id: row.get(0)?,
                title: row.get(1)?,
                body: row.get(2)?,
            })
        })?;
    let mut posts = Vec::new();
    for post in posts_iter {
        posts.push(post?);
    }
    Ok(posts)
}

#[get("/")]
fn index(context: State<Context>) -> Result<Json<ApiResponse<Vec<Post>>>, ApiError> {
    let conn = context.pool.clone().get()?;
    load_from_db(&conn)
        .map(|posts| {
            Json(ApiResponse::with(posts))
        })
}

#[catch(404)]
fn not_found() -> JsonValue {
    json!({
        "status": "error",
        "error": "Not found."
    })
}

#[catch(500)]
fn internal_error() -> JsonValue {
    json!({
        "status": "error",
        "error": "Internal error"
    })
}

fn main() {
    let manager = SqliteConnectionManager::file("db.sqlite");
    let pool = r2d2::Pool::builder()
        .max_size(10)
        .build(manager)
        .unwrap();


    let conn = pool.get().unwrap();

    conn.execute("
        create table if not exists posts (
            id integer primary key,
            title text not null,
            body text not null
        );
    ", NO_PARAMS)
        .expect("schema created");

    rocket::ignite()
        .manage(Context { pool })
        .register(catchers![not_found, internal_error])
        .mount("/", routes!(
            index
        ))
        .launch();
}
