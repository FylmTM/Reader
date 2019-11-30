use rusqlite::types::{FromSql, FromSqlError, FromSqlResult, ToSql, ToSqlOutput, ValueRef};
use serde::export::Formatter;
use std::error::Error;
use std::fmt;

#[derive(Clone, PartialEq, Debug, Serialize, Deserialize)]
pub struct User {
    pub id: i64,
    pub username: String,
}

#[derive(Copy, Clone, PartialEq, Debug, Serialize, Deserialize)]
pub enum FeedKind {
    RSS,
}

#[derive(Clone, PartialEq, Debug, Serialize, Deserialize)]
pub struct Feed {
    pub id: i64,
    pub kind: FeedKind,
    pub link: String,
    pub title: String,
}

impl FromSql for FeedKind {
    fn column_result(value: ValueRef<'_>) -> FromSqlResult<Self> {
        let kind = value.as_str().map(ToString::to_string)?;

        match kind.as_ref() {
            "RSS" => Ok(FeedKind::RSS),
            _ => Err(FromSqlError::Other(Box::new(
                AppFromSqlError::UnknownFeedKind,
            ))),
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

#[derive(Copy, PartialEq, Debug, Clone)]
pub enum AppFromSqlError {
    UnknownFeedKind,
}

impl Error for AppFromSqlError {}

impl fmt::Display for AppFromSqlError {
    fn fmt(&self, f: &mut Formatter) -> fmt::Result {
        write!(f, "{:?}", self)
    }
}
