use std::error::Error;
use std::fmt;

use rusqlite::types::{FromSql, FromSqlError, FromSqlResult, ToSql, ToSqlOutput, ValueRef};
use serde::export::Formatter;

#[derive(Clone, PartialEq, Debug, Serialize, Deserialize)]
pub struct User {
    pub id: i64,
    pub username: String,
}

#[derive(Clone, PartialEq, Debug, Serialize, Deserialize)]
pub struct Category {
    pub id: i64,
    pub name: String,
}

#[derive(Copy, Clone, PartialEq, Debug, Serialize, Deserialize)]
pub enum FeedKind {
    RSS,
}

#[derive(Clone, PartialEq, Debug, Serialize, Deserialize)]
pub struct Feed {
    pub id: i64,
    pub kind: FeedKind,
    pub title: String,
    /// Link to feed, that can be opened normally from browser.
    pub link: String,
    /// Link or identifier, that will be used by aggregator.
    pub feed: String,
}

#[derive(Clone, PartialEq, Debug, Serialize, Deserialize)]
pub struct MediaType {
    pub mime: String,
}

#[derive(Clone, PartialEq, Debug, Serialize, Deserialize)]
pub struct Post {
    pub id: i64,
    pub link: String,
    pub title: String,
    pub date: chrono::NaiveDateTime,
    pub summary: Option<String>,
    pub content: Option<String>,
    pub media_type: Option<MediaType>,
    pub media_link: Option<String>,
    pub comments_link: Option<String>,
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
