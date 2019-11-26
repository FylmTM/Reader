use rusqlite::Connection;

pub use self::entities::*;
use crate::error::Error;

pub mod bootstrap;
pub mod entities;

pub fn find_user(conn: &Connection, api_key: &str) -> Result<User, Error> {
    // language=SQLite
    let query = "
        select id, username
        from users
        where api_key = ?
    ";
    let mut statement = conn.prepare(query)?;
    let user = statement.query_row(&[api_key], |row| {
        Ok(User {
            id: row.get(0)?,
            username: row.get(1)?,
        })
    })?;
    Ok(user)
}
