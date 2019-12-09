pub use rusqlite::{Connection, NO_PARAMS};

pub use entities::*;
pub use pool::{Pool, PoolConnection};

use crate::error::{ApplicationError, Error, Result};

pub mod bootstrap;
pub mod entities;
pub mod pool;

pub type UserId = i64;
pub type CategoryId = i64;
pub type FeedId = i64;
pub type PostId = i64;
pub type UserPostId = i64;

pub trait Queries {
    fn find_user_by_api_key(&self, api_key: &str) -> Result<User>;
    fn find_user_ids_by_feed(&self, feed_id: FeedId) -> Result<Vec<UserId>>;
    fn find_categories_by_user_id(&self, id: UserId) -> Result<Vec<Category>>;
    fn find_feeds(&self) -> Result<Vec<Feed>>;
    fn find_feeds_by_category_id(&self, category_id: CategoryId) -> Result<Vec<Feed>>;
    fn find_feed_by_id(&self, id: FeedId) -> Result<Feed>;
    fn count_posts_by_user(&self, id: UserId) -> Result<i64>;
    fn count_posts_by_category(&self, id: CategoryId) -> Result<i64>;
    fn count_posts_by_feed(&self, id: FeedId) -> Result<i64>;
    fn save_post(&self, feed_id: FeedId, post: &Post) -> Result<PostId>;
    fn save_user_post(&self, user_id: UserId, post_id: PostId) -> Result<UserPostId>;
}

impl Queries for Connection {
    fn find_user_by_api_key(self: &Connection, api_key: &str) -> Result<User> {
        // language=SQLite
        let query = "
            select u.id, u.username
            from users u
            where u.api_key = ?
        ";
        let user = self.query_row(query, &[api_key], |row| {
            Ok(User {
                id: row.get(0)?,
                username: row.get(1)?,
            })
        })?;
        Ok(user)
    }

    fn find_user_ids_by_feed(self: &Connection, feed_id: FeedId) -> Result<Vec<i64>> {
        // language=SQLite
        let query = "
            select u.id
            from users u
            inner join categories c on u.id = c.user_id
            inner join category_feeds cf on c.id = cf.category_id
            where cf.feed_id = ?
        ";
        let mut statement = self.prepare(query)?;
        let user_ids_rows = statement.query_map(&[feed_id], |row| Ok(row.get(0)?))?;

        let mut user_ids = Vec::new();
        for user_id in user_ids_rows {
            user_ids.push(user_id?);
        }
        Ok(user_ids)
    }

    fn find_categories_by_user_id(self: &Connection, id: UserId) -> Result<Vec<Category>> {
        // language=SQLite
        let query = "
            select c.id, c.name
            from categories c
            where c.user_id = ?
        ";
        let mut statement = self.prepare(query)?;
        let categories_rows = statement.query_map(&[id], |row| {
            Ok(Category {
                id: row.get(0)?,
                name: row.get(1)?,
            })
        })?;

        let mut categories = Vec::new();
        for category in categories_rows {
            categories.push(category?)
        }
        Ok(categories)
    }

    //noinspection DuplicatedCode
    fn find_feeds(self: &Connection) -> Result<Vec<Feed>> {
        // language=SQLite
        let query = "
            select f.id, f.kind, f.title, f.link, f.feed
            from feeds f
        ";
        let mut statement = self.prepare(query)?;
        let feeds_rows = statement.query_map(NO_PARAMS, map_row_to_feed)?;

        let mut feeds = Vec::new();
        for feed in feeds_rows {
            feeds.push(feed?)
        }
        Ok(feeds)
    }

    fn find_feeds_by_category_id(self: &Connection, category_id: CategoryId) -> Result<Vec<Feed>> {
        // language=SQLite
        let query = "
            select f.id, f.kind, f.title, f.link, f.feed
            from category_feeds cf
            left join feeds f on cf.feed_id = f.id
            where cf.category_id = ?
        ";
        let mut statement = self.prepare(query)?;
        let feeds_rows = statement.query_map(&[category_id], map_row_to_feed)?;

        let mut feeds = Vec::new();
        for feed in feeds_rows {
            feeds.push(feed?)
        }
        Ok(feeds)
    }

    //noinspection DuplicatedCode
    fn find_feed_by_id(self: &Connection, id: FeedId) -> Result<Feed> {
        // language=SQLite
        let query = "
            select f.id, f.kind, f.title, f.link, f.feed
            from feeds f
            where f.id = ?
        ";
        let feed = self.query_row(query, &[id], |row| {
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

    fn count_posts_by_user(self: &Connection, id: UserId) -> Result<i64> {
        // language=SQLite
        let query = "
            select count(up.post_id)
            from user_posts up
            where up.user_id = ?
        ";
        let count = self.query_row(query, &[id], |row| row.get(0))?;
        Ok(count)
    }

    fn count_posts_by_category(self: &Connection, id: CategoryId) -> Result<i64> {
        // language=SQLite
        let query = "
            select count(p.id)
            from categories c
            inner join category_feeds cf on c.id = cf.category_id
            inner join posts p on cf.feed_id = p.feed_id
            where c.id = ?
        ";
        let count = self.query_row(query, &[id], |row| row.get(0))?;
        Ok(count)
    }

    fn count_posts_by_feed(self: &Connection, id: FeedId) -> Result<i64> {
        // language=SQLite
        let query = "
            select count(p.id)
            from posts p
            where p.feed_id = ?
        ";
        let count = self.query_row(query, &[id], |row| row.get(0))?;
        Ok(count)
    }

    fn save_post(self: &Connection, feed_id: FeedId, post: &Post) -> Result<PostId> {
        // language=SQLite
        let query = "
            insert or ignore into posts(feed_id, link, title, date, summary, content, media_type, media_link, comments_link)
            values (:feed_id, :link, :title, :date, :summary, :content, :media_type, :media_link, :comments_link)
        ";
        let count = self.execute_named(
            query,
            &[
                (":feed_id", &feed_id),
                (":link", &post.link),
                (":title", &post.title),
                (":date", &post.date),
                (":summary", &post.summary),
                (":content", &post.content),
                (":media_type", &post.media_link),
                (":comments_link", &post.comments_link),
            ],
        )?;
        check_one_entity_inserted(count)?;
        Ok(self.last_insert_rowid())
    }

    fn save_user_post(&self, user_id: UserId, post_id: PostId) -> Result<UserPostId> {
        // language=SQLite
        let query = "
            insert or ignore into user_posts(user_id, post_id)
            values (:user_id, :post_id)
        ";
        let count = self.execute_named(query, &[(":user_id", &user_id), (":post_id", &post_id)])?;
        check_one_entity_inserted(count)?;
        Ok(self.last_insert_rowid())
    }
}

fn map_row_to_feed(row: &rusqlite::Row) -> rusqlite::Result<Feed> {
    Ok(Feed {
        id: row.get(0)?,
        kind: row.get(1)?,
        title: row.get(2)?,
        link: row.get(3)?,
        feed: row.get(4)?,
    })
}

fn check_one_entity_inserted(count: usize) -> Result<()> {
    if count == 1 {
        Ok(())
    } else if count == 0 {
        Err(Error::App(ApplicationError::QueryEntityAlreadyExists))
    } else {
        Err(Error::App(ApplicationError::QueryUnexpectedRowCount {
            expected: 1,
            actual: count as i64,
        }))
    }
}
