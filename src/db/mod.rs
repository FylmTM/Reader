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
    fn find_categories_by_user(&self, user_id: UserId) -> Result<Vec<Category>>;
    fn find_feeds(&self) -> Result<Vec<Feed>>;
    fn find_feeds_by_category(&self, category_id: CategoryId) -> Result<Vec<Feed>>;
    fn find_feed(&self, id: FeedId) -> Result<Feed>;
    fn find_posts_by_user(&self, user_id: UserId) -> Result<Vec<UserPost>>;
    fn find_posts_read_later_by_user(&self, user_id: UserId) -> Result<Vec<UserPost>>;
    fn find_posts_by_user_and_category(
        &self,
        user_id: UserId,
        category_id: CategoryId,
    ) -> Result<Vec<UserPost>>;
    fn find_posts_by_user_and_feed(
        &self,
        user_id: UserId,
        feed_id: FeedId,
    ) -> Result<Vec<UserPost>>;
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
            where u.api_key = :api_key
        ";
        let user = self.query_row_named(query, &[(":api_key", &api_key)], |row| {
            Ok(User {
                id: row.get("id")?,
                username: row.get("username")?,
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
            where cf.feed_id = :feed_id
        ";
        let mut statement = self.prepare(query)?;
        let user_ids_rows =
            statement.query_map_named(&[(":feed_id", &feed_id)], |row| Ok(row.get("id")?))?;

        let mut user_ids = Vec::new();
        for user_id in user_ids_rows {
            user_ids.push(user_id?);
        }
        Ok(user_ids)
    }

    fn find_categories_by_user(self: &Connection, user_id: UserId) -> Result<Vec<Category>> {
        // language=SQLite
        let query = "
            select c.id, c.name
            from categories c
            where c.user_id = :user_id
        ";
        let mut statement = self.prepare(query)?;
        let categories_rows = statement.query_map_named(&[(":user_id", &user_id)], |row| {
            Ok(Category {
                id: row.get("id")?,
                name: row.get("name")?,
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

    fn find_feeds_by_category(self: &Connection, category_id: CategoryId) -> Result<Vec<Feed>> {
        // language=SQLite
        let query = "
            select f.id, f.kind, f.title, f.link, f.feed
            from category_feeds cf
            left join feeds f on cf.feed_id = f.id
            where cf.category_id = :category_id
        ";
        let mut statement = self.prepare(query)?;
        let feeds_rows =
            statement.query_map_named(&[(":category_id", &category_id)], map_row_to_feed)?;

        let mut feeds = Vec::new();
        for feed in feeds_rows {
            feeds.push(feed?)
        }
        Ok(feeds)
    }

    //noinspection DuplicatedCode
    fn find_feed(self: &Connection, id: FeedId) -> Result<Feed> {
        // language=SQLite
        let query = "
            select f.id, f.kind, f.title, f.link, f.feed
            from feeds f
            where f.id = :id
        ";
        let feed = self.query_row_named(query, &[(":id", &id)], map_row_to_feed)?;
        Ok(feed)
    }

    fn find_posts_by_user(&self, user_id: UserId) -> Result<Vec<UserPost>> {
        // language=SQLite
        let query = "
            select p.id, cf.category_id, f.id as feed_id, f.title as feed_title, up.is_read, up.is_read_later,
                   p.link, p.title, p.date, p.summary, p.media_type, p.media_link, p.comments_link
            from user_posts up
            inner join posts p on up.post_id = p.id
            inner join feeds f on p.feed_id = f.id
            inner join category_feeds cf on f.id = cf.feed_id
            where up.user_id = :user_id
            order by up.id desc
        ";
        let mut statement = self.prepare(query)?;
        let user_post_rows =
            statement.query_map_named(&[(":user_id", &user_id)], map_row_to_user_post)?;

        let mut user_posts = Vec::new();
        for user_post in user_post_rows {
            user_posts.push(user_post?)
        }
        Ok(user_posts)
    }

    fn find_posts_read_later_by_user(&self, user_id: UserId) -> Result<Vec<UserPost>> {
        // language=SQLite
        let query = "
            select p.id, cf.category_id, f.id as feed_id, f.title as feed_title, up.is_read, up.is_read_later,
                   p.link, p.title, p.date, p.summary, p.media_type, p.media_link, p.comments_link
            from user_posts up
            inner join posts p on up.post_id = p.id
            inner join feeds f on p.feed_id = f.id
            inner join category_feeds cf on f.id = cf.feed_id
            where up.user_id = :user_id
            and up.is_read_later = true
            order by up.id desc
        ";
        let mut statement = self.prepare(query)?;
        let user_post_rows =
            statement.query_map_named(&[(":user_id", &user_id)], map_row_to_user_post)?;

        let mut user_posts = Vec::new();
        for user_post in user_post_rows {
            user_posts.push(user_post?)
        }
        Ok(user_posts)
    }

    fn find_posts_by_user_and_category(
        &self,
        user_id: UserId,
        category_id: CategoryId,
    ) -> Result<Vec<UserPost>> {
        // language=SQLite
        let query = "
            select p.id, cf.category_id, f.id as feed_id, f.title as feed_title, up.is_read, up.is_read_later,
                   p.link, p.title, p.date, p.summary, p.media_type, p.media_link, p.comments_link
            from user_posts up
            inner join posts p on up.post_id = p.id
            inner join feeds f on p.feed_id = f.id
            inner join category_feeds cf on f.id = cf.feed_id
            where up.user_id = :user_id
            and cf.category_id = :category_id
            order by up.id desc
        ";
        let mut statement = self.prepare(query)?;
        let user_post_rows = statement.query_map_named(
            &[(":user_id", &user_id), (":category_id", &category_id)],
            map_row_to_user_post,
        )?;

        let mut user_posts = Vec::new();
        for user_post in user_post_rows {
            user_posts.push(user_post?)
        }
        Ok(user_posts)
    }

    fn find_posts_by_user_and_feed(
        &self,
        user_id: UserId,
        feed_id: FeedId,
    ) -> Result<Vec<UserPost>> {
        // language=SQLite
        let query = "
            select p.id, cf.category_id, f.id as feed_id, f.title as feed_title, up.is_read, up.is_read_later,
                   p.link, p.title, p.date, p.summary, p.media_type, p.media_link, p.comments_link
            from user_posts up
            inner join posts p on up.post_id = p.id
            inner join feeds f on p.feed_id = f.id
            inner join category_feeds cf on f.id = cf.feed_id
            where up.user_id = :user_id
            and f.id = :feed_id
            order by up.id desc
        ";
        let mut statement = self.prepare(query)?;
        let user_post_rows = statement.query_map_named(
            &[(":user_id", &user_id), (":feed_id", &feed_id)],
            map_row_to_user_post,
        )?;

        let mut user_posts = Vec::new();
        for user_post in user_post_rows {
            user_posts.push(user_post?)
        }
        Ok(user_posts)
    }

    fn count_posts_by_user(self: &Connection, user_id: UserId) -> Result<i64> {
        // language=SQLite
        let query = "
            select count(up.post_id) as count
            from user_posts up
            where up.user_id = :user_id
        ";
        let count =
            self.query_row_named(query, &[(":user_id", &user_id)], |row| row.get("count"))?;
        Ok(count)
    }

    fn count_posts_by_category(self: &Connection, category_id: CategoryId) -> Result<i64> {
        // language=SQLite
        let query = "
            select count(p.id) as count
            from categories c
            inner join category_feeds cf on c.id = cf.category_id
            inner join posts p on cf.feed_id = p.feed_id
            where c.id = :category_id
        ";
        let count = self.query_row_named(query, &[(":category_id", &category_id)], |row| {
            row.get("count")
        })?;
        Ok(count)
    }

    fn count_posts_by_feed(self: &Connection, feed_id: FeedId) -> Result<i64> {
        // language=SQLite
        let query = "
            select count(p.id) as count
            from posts p
            where p.feed_id = :feed_id
        ";
        let count =
            self.query_row_named(query, &[(":feed_id", &feed_id)], |row| row.get("count"))?;
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

fn map_row_to_user_post(row: &rusqlite::Row) -> rusqlite::Result<UserPost> {
    Ok(UserPost {
        id: row.get("id")?,
        category_id: row.get("category_id")?,
        feed_id: row.get("feed_id")?,
        feed_title: row.get("feed_title")?,
        is_read: row.get("is_read")?,
        is_read_later: row.get("is_read_later")?,
        link: row.get("link")?,
        title: row.get("title")?,
        date: row.get("date")?,
        summary: row.get("summary")?,
        media_type: row.get("media_type")?,
        media_link: row.get("media_link")?,
        comments_link: row.get("comments_link")?,
    })
}

fn map_row_to_feed(row: &rusqlite::Row) -> rusqlite::Result<Feed> {
    Ok(Feed {
        id: row.get("id")?,
        kind: row.get("kind")?,
        title: row.get("title")?,
        link: row.get("link")?,
        feed: row.get("feed")?,
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
