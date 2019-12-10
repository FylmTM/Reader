use std::ops::{Deref, DerefMut};

use rocket::http::Status;
use rocket::request::FromRequest;
use rocket::{Outcome, Request, State};

use crate::db;
use crate::error::Error as E;

pub type Pool = r2d2::Pool<r2d2_sqlite::SqliteConnectionManager>;

pub struct PoolConnection {
    pub connection: r2d2::PooledConnection<r2d2_sqlite::SqliteConnectionManager>,
}

impl Deref for PoolConnection {
    type Target = db::Connection;

    fn deref(&self) -> &Self::Target {
        &self.connection
    }
}

impl DerefMut for PoolConnection {
    fn deref_mut(&mut self) -> &mut Self::Target {
        &mut self.connection
    }
}

impl<'a, 'r> FromRequest<'a, 'r> for PoolConnection {
    type Error = E;

    fn from_request(request: &'a Request<'r>) -> rocket::request::Outcome<Self, E> {
        let pool = request
            .guard::<State<db::Pool>>()
            .expect("Failed to get pool.");

        match pool.clone().get() {
            Ok(connection) => Outcome::Success(PoolConnection { connection }),
            Err(err) => {
                error!("Failed to acquire connection.");
                Outcome::Failure((Status::InternalServerError, E::Pool(err)))
            }
        }
    }
}
