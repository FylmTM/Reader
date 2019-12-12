/// This whole module is using vanilla rusqlite, without Diesel.
/// At the time of creating adding database support author wanted to stay
/// as close as possible to low-level libraries and write plain-SQL queries.
///
/// Because of that you can find poor-mans migrations module here, and some
/// nasty looking string manipulations for dynamic queries.
///
/// Author might reconsider his choice in future.
pub use rusqlite::{Connection, NO_PARAMS};

pub use entities::*;
pub use pool::{Pool, PoolConnection};

use crate::error::{ApplicationError, Error, Result};
use std::collections::HashMap;

pub mod bootstrap;
pub mod entities;
pub mod pool;

const PAGE_SIZE: usize = 50;

pub trait Queries {
    fn find_user_by_api_key(&self, api_key: &str) -> Result<User>;
    fn find_user_ids_by_feed(&self, feed_id: FeedId) -> Result<Vec<UserId>>;
    fn find_categories_by_user(&self, user_id: UserId) -> Result<Vec<Category>>;
    fn find_feeds(&self) -> Result<Vec<Feed>>;
    fn find_feeds_by_category(&self, category_id: CategoryId) -> Result<Vec<Feed>>;
    fn find_feed(&self, id: FeedId) -> Result<Feed>;
    fn find_posts(
        &self,
        user_id: UserId,
        from_post_id: Option<PostId>,
        is_read_later: Option<bool>,
        is_read: Option<bool>,
        category_id: Option<CategoryId>,
        feed_id: Option<FeedId>,
    ) -> Result<Page<UserPost>>;
    fn find_post_content_by_user(
        &self,
        user_id: UserId,
        post_id: PostId,
    ) -> Result<UserPostContent>;
    fn set_post_is_read(&self, user_id: UserId, post_id: PostId, is_read: bool) -> Result<()>;
    fn set_post_is_read_later(
        &self,
        user_id: UserId,
        post_id: PostId,
        is_read_later: bool,
    ) -> Result<()>;
    fn count_posts_unread(&self, user_id: UserId) -> Result<UserPostsUnreadCount>;
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
            inner join user_categories uc on u.id = uc.user_id
            inner join user_category_feeds ucf on uc.id = ucf.category_id
            where ucf.feed_id = :feed_id
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
            select uc.id, uc.title
            from user_categories uc
            where uc.user_id = :user_id
        ";
        let mut statement = self.prepare(query)?;
        let categories_rows = statement.query_map_named(&[(":user_id", &user_id)], |row| {
            Ok(Category {
                id: row.get("id")?,
                title: row.get("title")?,
            })
        })?;

        let mut categories = Vec::new();
        for category in categories_rows {
            categories.push(category?)
        }
        Ok(categories)
    }

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
            select f.id, f.kind, ucf.title, f.link, f.feed
            from user_category_feeds ucf
            inner join feeds f on ucf.feed_id = f.id
            where ucf.category_id = :category_id
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

    fn find_posts(
        &self,
        user_id: UserId,
        from_post_id: Option<PostId>,
        is_read_later: Option<bool>,
        is_read: Option<bool>,
        category_id: Option<CategoryId>,
        feed_id: Option<FeedId>,
    ) -> Result<Page<UserPost>> {
        let sql_from_post_id = from_post_id
            .map(|_| "and up.post_id < :post_id")
            .unwrap_or("");
        let sql_is_read_later = is_read_later
            .map(|_| "and up.is_read_later = :is_read_later")
            .unwrap_or("");
        let sql_is_read = is_read.map(|_| "and up.is_read = :is_read").unwrap_or("");
        let sql_category_id = category_id
            .map(|_| "and ucf.category_id = :category_id")
            .unwrap_or("");
        let sql_feed_id = feed_id.map(|_| "and ucf.feed_id = :feed_id").unwrap_or("");

        // language=SQLite
        let query = format!(
            "
            select p.id, ucf.category_id, ucf.feed_id as feed_id, ucf.title as feed_title,
                   up.is_read, up.read_date, up.is_read_later,
                   p.link, p.title, p.date, p.summary, p.media_type, p.media_link, p.comments_link
            from user_posts up
            inner join posts p on up.post_id = p.id
            inner join user_category_feeds ucf on p.feed_id = ucf.feed_id
            where up.user_id = :user_id
            {}
            {}
            {}
            {}
            {}
            order by up.post_id desc
            limit {};
        ",
            sql_from_post_id,
            sql_is_read_later,
            sql_is_read,
            sql_category_id,
            sql_feed_id,
            PAGE_SIZE + 1
        );
        let mut statement = self.prepare(&query)?;

        let mut params: Vec<(&str, &dyn rusqlite::ToSql)> = Vec::new();
        params.push((":user_id", &user_id));

        if from_post_id.is_some() {
            params.push((":post_id", from_post_id.as_ref().unwrap()));
        }
        if is_read_later.is_some() {
            params.push((":is_read_later", is_read_later.as_ref().unwrap()));
        }
        if is_read.is_some() {
            params.push((":is_read", is_read.as_ref().unwrap()));
        }
        if category_id.is_some() {
            params.push((":category_id", category_id.as_ref().unwrap()));
        }
        if feed_id.is_some() {
            params.push((":feed_id", feed_id.as_ref().unwrap()));
        }

        let user_post_rows = statement.query_map_named(params.as_slice(), map_row_to_user_post)?;
        let mut user_posts = Vec::new();
        for user_post in user_post_rows {
            user_posts.push(user_post?)
        }

        // We are querying for PAGE_SIZE + 1.
        // If there is more elements than PAGE_SIZE, then there is another non-empty page.
        let has_next_page = user_posts.len() > PAGE_SIZE;
        user_posts.truncate(PAGE_SIZE);
        Ok(Page {
            has_next_page,
            items: user_posts,
        })
    }

    fn find_post_content_by_user(
        &self,
        user_id: UserId,
        post_id: PostId,
    ) -> Result<UserPostContent> {
        // language=SQLite
        let query = "
            select p.id, p.content
            from user_posts up
            inner join posts p on up.post_id = p.id
            where up.post_id = :post_id
            and up.user_id = :user_id
        ";
        let mut statement = self.prepare(query)?;
        let user_post_content = statement.query_row_named(
            &[(":user_id", &user_id), (":post_id", &post_id)],
            |row| {
                Ok(UserPostContent {
                    id: row.get("id")?,
                    content: row.get("content")?,
                })
            },
        )?;

        Ok(user_post_content)
    }

    fn set_post_is_read(&self, user_id: UserId, post_id: PostId, is_read: bool) -> Result<()> {
        // language=SQLite
        let query = "
            update user_posts
            set is_read = :is_read,
                read_date = :read_date
            where post_id = :post_id
            and user_id = :user_id
        ";
        let read_date: Option<chrono::DateTime<chrono::Utc>> = if is_read {
            Some(chrono::DateTime::from(chrono::Utc::now()))
        } else {
            None
        };
        let count = self.execute_named(
            query,
            &[
                (":user_id", &user_id),
                (":post_id", &post_id),
                (":is_read", &is_read),
                (":read_date", &read_date),
            ],
        )?;
        check_one_entity_updated(count)?;
        return Ok(());
    }

    fn set_post_is_read_later(
        &self,
        user_id: UserId,
        post_id: PostId,
        is_read_later: bool,
    ) -> Result<()> {
        // language=SQLite
        let query = "
            update user_posts
            set is_read_later = :is_read_later
            where post_id = :post_id
            and user_id = :user_id
        ";
        let count = self.execute_named(
            query,
            &[
                (":user_id", &user_id),
                (":post_id", &post_id),
                (":is_read_later", &is_read_later),
            ],
        )?;
        check_one_entity_updated(count)?;
        return Ok(());
    }

    fn count_posts_unread(&self, user_id: UserId) -> Result<UserPostsUnreadCount> {
        let mut count = UserPostsUnreadCount {
            all: 0,
            categories: HashMap::new(),
            feeds: HashMap::new(),
        };
        // language=SQLite
        let query = "
            select ucf.category_id as category_id, ucf.feed_id as feed_id, count(up.post_id) as count
            from user_posts up
            inner join posts p on up.post_id = p.id
            inner join user_category_feeds ucf on p.feed_id = ucf.feed_id
            where up.user_id = :user_id
            and up.is_read = false
            group by ucf.feed_id
        ";
        let mut statement = self.prepare(query)?;
        let rows = statement.query_map_named(&[(":user_id", &user_id)], |row| {
            Ok(CategoryFeedUnreadCount {
                category_id: row.get("category_id")?,
                feed_id: row.get("feed_id")?,
                count: row.get("count")?,
            })
        })?;

        for row in rows {
            let row = row?;
            count.all += row.count;
            count.categories.insert(
                row.category_id,
                count
                    .categories
                    .get(&row.category_id)
                    .map(|c| c + row.count)
                    .unwrap_or(row.count),
            );
            count.feeds.insert(row.feed_id, row.count);
        }

        Ok(count)
    }

    fn save_post(self: &Connection, feed_id: FeedId, post: &Post) -> Result<PostId> {
        // language=SQLite
        let query = "
            insert or ignore into posts(feed_id, unique_id, link, title, date, summary, content, media_type, media_link, comments_link)
            values (:feed_id, :unique_id, :link, :title, :date, :summary, :content, :media_type, :media_link, :comments_link)
        ";
        let count = self.execute_named(
            query,
            &[
                (":feed_id", &feed_id),
                (":unique_id", &post.unique_id),
                (":link", &post.link),
                (":title", &post.title),
                (":date", &post.date),
                (":summary", &post.summary),
                (":content", &post.content),
                (":media_type", &post.media_type),
                (":media_link", &post.media_link),
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
        read_date: row.get("read_date")?,
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

//noinspection DuplicatedCode
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

//noinspection DuplicatedCode
fn check_one_entity_updated(count: usize) -> Result<()> {
    if count == 1 {
        Ok(())
    } else if count == 0 {
        Err(Error::App(ApplicationError::QueryEntityNotFound))
    } else {
        Err(Error::App(ApplicationError::QueryUnexpectedRowCount {
            expected: 1,
            actual: count as i64,
        }))
    }
}
