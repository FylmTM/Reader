use rusqlite::{Connection, NO_PARAMS};

pub use self::entities::Post;
use crate::error::Error;

mod entities;

pub fn initialize(conn: &Connection) {
    conn.execute(include_str!("queries/schema.sql"), NO_PARAMS)
        .expect("schema created");
}

pub fn find_posts(conn: &Connection) -> Result<Vec<Post>, Error> {
    let mut statement = conn.prepare("SELECT id, title, body FROM posts")?;
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
