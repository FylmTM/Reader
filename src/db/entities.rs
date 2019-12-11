use std::error::Error;
use std::fmt;

use rusqlite::types::{FromSql, FromSqlError, FromSqlResult, ToSql, ToSqlOutput, ValueRef};
use serde::export::Formatter;
use std::collections::HashMap;

pub type UserId = i64;
pub type CategoryId = i64;
pub type FeedId = i64;
pub type PostId = i64;
pub type UserPostId = i64;

#[derive(Clone, PartialEq, Debug, Serialize, Deserialize)]
pub struct Page<T> {
    pub has_next_page: bool,
    pub items: Vec<T>,
}

#[derive(Clone, PartialEq, Debug, Serialize, Deserialize)]
pub struct User {
    pub id: UserId,
    pub username: String,
}

#[derive(Clone, PartialEq, Debug, Serialize, Deserialize)]
pub struct Category {
    pub id: CategoryId,
    pub title: String,
}

#[derive(Copy, Clone, PartialEq, Debug, Serialize, Deserialize)]
pub enum FeedKind {
    RSS,
}

#[derive(Clone, PartialEq, Debug, Serialize, Deserialize)]
pub struct Feed {
    pub id: FeedId,
    pub kind: FeedKind,
    pub title: String,
    /// Link to feed, that can be opened normally from browser.
    pub link: String,
    /// Link or identifier, that will be used by aggregator.
    pub feed: String,
}

#[derive(Clone, PartialEq, Debug, Serialize, Deserialize)]
pub struct CategoryWithFeeds {
    pub category: Category,
    pub feeds: Vec<Feed>,
}

pub type CategoriesWithFeeds = Vec<CategoryWithFeeds>;

#[derive(Clone, PartialEq, Debug, Serialize, Deserialize)]
pub struct MediaType {
    #[serde(rename = "media_type")]
    pub mime: String,
}

#[derive(Clone, PartialEq, Debug, Serialize, Deserialize)]
pub struct Post {
    pub id: PostId,
    pub link: String,
    pub title: String,
    pub date: chrono::DateTime<chrono::Utc>,
    pub summary: Option<String>,
    pub content: Option<String>,
    #[serde(flatten)]
    pub media_type: Option<MediaType>,
    pub media_link: Option<String>,
    pub comments_link: Option<String>,
}

#[derive(Clone, PartialEq, Debug, Serialize, Deserialize)]
pub struct UserPost {
    pub id: PostId,
    pub category_id: CategoryId,
    pub feed_id: FeedId,
    pub feed_title: String,
    pub is_read: bool,
    pub read_date: Option<chrono::DateTime<chrono::Utc>>,
    pub is_read_later: bool,
    pub link: String,
    pub title: String,
    pub date: chrono::DateTime<chrono::Utc>,
    pub summary: Option<String>,
    #[serde(flatten)]
    pub media_type: Option<MediaType>,
    pub media_link: Option<String>,
    pub comments_link: Option<String>,
}

#[derive(Clone, PartialEq, Debug, Serialize, Deserialize)]
pub struct UserPostsUnreadCount {
    pub all: i64,
    pub categories: HashMap<CategoryId, i64>,
    pub feeds: HashMap<FeedId, i64>,
}

pub struct CategoryFeedUnreadCount {
    pub category_id: CategoryId,
    pub feed_id: FeedId,
    pub count: i64,
}

#[derive(Clone, PartialEq, Debug, Serialize, Deserialize)]
pub struct UserPostContent {
    pub id: PostId,
    pub content: Option<String>,
}

impl FromSql for FeedKind {
    fn column_result(value: ValueRef<'_>) -> FromSqlResult<Self> {
        let kind = value.as_str().map(ToString::to_string)?;

        match kind.as_ref() {
            "RSS" => Ok(FeedKind::RSS),
            _ => Err(FromSqlError::Other(Box::new(AppSqlError::UnknownFeedKind))),
        }
    }
}

impl ToSql for FeedKind {
    fn to_sql(&self) -> rusqlite::Result<ToSqlOutput<'_>> {
        let kind = match self {
            FeedKind::RSS => "RSS",
        };
        Ok(ToSqlOutput::from(kind))
    }
}

impl FromSql for MediaType {
    fn column_result(value: ValueRef<'_>) -> FromSqlResult<Self> {
        let media_type = value.as_str().map(ToString::to_string)?;

        let mime = media_type.parse::<mime::Mime>();
        match mime {
            Ok(mime) => Ok(MediaType {
                mime: mime.to_string(),
            }),
            Err(_) => Err(FromSqlError::Other(Box::new(AppSqlError::InvalidMediaType))),
        }
    }
}

impl ToSql for MediaType {
    fn to_sql(&self) -> rusqlite::Result<ToSqlOutput<'_>> {
        let result = self.mime.parse::<mime::Mime>();
        if result.is_err() {
            Err(rusqlite::Error::ToSqlConversionFailure(Box::new(
                AppSqlError::InvalidMediaType,
            )))
        } else {
            Ok(ToSqlOutput::from(self.mime.clone()))
        }
    }
}

#[derive(Copy, PartialEq, Debug, Clone)]
pub enum AppSqlError {
    UnknownFeedKind,
    InvalidMediaType,
}

impl Error for AppSqlError {}

impl fmt::Display for AppSqlError {
    fn fmt(&self, f: &mut Formatter) -> fmt::Result {
        write!(f, "{:?}", self)
    }
}
