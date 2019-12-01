use crate::error::Result;
pub use entities::*;
pub use pool::{Pool, PoolConnection};
pub use rusqlite::{Connection, NO_PARAMS};
pub mod bootstrap;
pub mod entities;
pub mod pool;

pub fn find_user_by_api_key(conn: &Connection, api_key: &str) -> Result<User> {
    // language=SQLite
    let query = "
        select u.id, u.username
        from users u
        where u.api_key = ?
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

pub fn find_user_category_ids_by_feed(conn: &Connection, feed_id: i64) -> Result<Vec<(i64, i64)>> {
    // language=SQLite
    let query = "
        select u.id, c.id
        from users u
        inner join categories c on u.id = c.user_id
        inner join category_feeds cf on c.id = cf.category_id
        where cf.feed_id = ?
    ";
    let mut statement = conn.prepare(query)?;
    let ids_rows = statement.query_map(&[feed_id], |row| Ok((row.get(0)?, row.get(1)?)))?;

    let mut user_category_ids = Vec::new();
    for ids in ids_rows {
        user_category_ids.push(ids?);
    }
    Ok(user_category_ids)
}

//noinspection DuplicatedCode
pub fn find_feeds(conn: &Connection) -> Result<Vec<Feed>> {
    // language=SQLite
    let query = "
        select f.id, f.kind, f.title, f.link, f.feed
        from feeds f
    ";
    let mut statement = conn.prepare(query)?;
    let feeds_rows = statement.query_map(NO_PARAMS, |row| {
        Ok(Feed {
            id: row.get(0)?,
            kind: row.get(1)?,
            title: row.get(2)?,
            link: row.get(3)?,
            feed: row.get(4)?,
        })
    })?;

    let mut feeds = Vec::new();
    for feed in feeds_rows {
        feeds.push(feed?)
    }
    Ok(feeds)
}

//noinspection DuplicatedCode
pub fn find_feed_by_id(conn: &Connection, id: i64) -> Result<Feed> {
    // language=SQLite
    let query = "
        select f.id, f.kind, f.title, f.link, f.feed
        from feeds f
        where f.id = ?
    ";
    let mut statement = conn.prepare(query)?;
    let feed = statement.query_row(&[id], |row| {
        Ok(Feed {
            id: row.get(0)?,
            kind: row.get(1)?,
            title: row.get(2)?,
            link: row.get(3)?,
            feed: row.get(4)?,
        })
    })?;

    Ok(feed)
}

pub fn count_posts_by_feed(conn: &Connection, id: i64) -> Result<i64> {
    // language=SQLite
    let query = "
        select count(p.id)
        from posts p
        where p.feed_id = ?
    ";
    let mut statement = conn.prepare(query)?;
    let count = statement.query_row(&[id], |row| row.get(0))?;

    Ok(count)
}

pub fn count_posts_by_user(conn: &Connection, id: i64) -> Result<i64> {
    // language=SQLite
    let query = "
        select count(up.post_id)
        from user_posts up
        where up.user_id = ?
    ";
    let mut statement = conn.prepare(query)?;
    let count = statement.query_row(&[id], |row| row.get(0))?;

    Ok(count)
}
