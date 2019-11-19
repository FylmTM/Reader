use rusqlite::{Connection, NO_PARAMS};

pub use self::entities::*;
use crate::error::Error;

pub mod bootstrap;
pub mod entities;

pub fn find_posts(conn: &Connection) -> Result<Vec<Post>, Error> {
    let mut statement = conn.prepare(include_str!("queries/find_posts.sql"))?;
    let result = statement.query_map(NO_PARAMS, |row| {
        Ok(Post {
            id: row.get(0)?,
            title: row.get(1)?,
            body: row.get(2)?,
        })
    })?;

    let mut posts = Vec::new();
    for post in result {
        posts.push(post?);
    }
    Ok(posts)
}
