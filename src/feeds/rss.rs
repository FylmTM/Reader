use crate::db::{self, Queries};
use crate::error::{ApplicationError, Error, Result};

pub fn update(conn: &mut db::Connection, feed: &db::Feed) -> Result<()> {
    let user_ids = conn.find_user_ids_by_feed(feed.id)?;
    if user_ids.is_empty() {
        debug!("{:?} does not belong to any user, skip update.", feed);
        return Ok(());
    }
    let content = get(&feed.feed)?;
    let posts = parse(&content)?;

    for post in posts {
        let tx = conn.transaction()?;

        match tx.save_post(feed.id, &post) {
            Ok(post_id) => {
                debug!("{:?} saved.", post);
                for user_id in &user_ids {
                    tx.save_user_post(*user_id, post_id)?;
                }
                tx.commit()?;
            }
            Err(Error::App(ApplicationError::QueryEntityAlreadyExists)) => {
                debug!("{:?} already exists.", &post)
            }
            Err(error) => return Err(error),
        }
    }

    Ok(())
}

fn get(link: &String) -> Result<String> {
    let mut response = reqwest::get(link)?;

    if response.status() != reqwest::StatusCode::OK {
        error!(
            "Failed to retrieve feed={} with status={}",
            link,
            response.status()
        );
        return Err(Error::App(ApplicationError::RSSFailedToRetrieve(
            link.clone(),
        )));
    }

    return Ok(response.text()?);
}

fn parse(content: &String) -> Result<Vec<db::Post>> {
    let channel = rss::Channel::read_from(content.as_bytes())?;

    let mut posts = Vec::with_capacity(channel.items().len());

    for item in channel.items() {
        let link = item
            .link()
            .ok_or(Error::App(ApplicationError::RSSParsingMissingItemLink))?
            .to_string();
        let title = item
            .title()
            .ok_or(Error::App(ApplicationError::RSSParsingMissingItemLink))?
            .to_string();
        let date = match item.pub_date() {
            Some(date) => parse_date(date)?,
            None => chrono::Utc::now().naive_utc(),
        };
        let summary = item.description().map(String::from);
        let content = item.content().map(String::from);
        let comments_link = item.comments().map(String::from);
        let media = item.enclosure().and_then(|enclosure| {
            let url = enclosure.url();
            let mime_type = enclosure.mime_type();
            if url.is_empty() || mime_type.is_empty() {
                return None;
            }
            if mime_type.parse::<mime::Mime>().is_err() {
                return None;
            }

            Some((mime_type, url))
        });

        let post = db::Post {
            id: -1, // Post is not retrieved from database
            link,
            title,
            date,
            summary,
            content,
            media_type: media.map(|m| db::MediaType {
                mime: m.0.to_string(),
            }),
            media_link: media.map(|m| m.1.to_string()),
            comments_link,
        };
        posts.push(post);
    }

    // Items are sorted from newest to oldest, but for database insertion
    // we need them sorted from oldest to newest.
    posts.reverse();
    Ok(posts)
}

fn parse_date(date: &str) -> Result<chrono::NaiveDateTime> {
    let result = chrono::DateTime::parse_from_rfc2822(date)
        .or_else(|_| {
            // chrono consider "-0000" timezone to be "missing"
            // We will blindly replace it with +0000 if it exists, and try to parse again.
            let date = date.replace("-0000", "+0000");
            chrono::DateTime::parse_from_rfc2822(&date)
        })
        .map(|date| date.naive_utc())?;
    Ok(result)
}

#[cfg(test)]
mod tests {
    use crate::db;
    use crate::feeds::rss::{parse, parse_date};

    #[test]
    fn test_parse_rss_hacker_news() {
        let content = include_str!("snapshots/rss_hacker_news.xml").to_string();
        let result = parse(&content).unwrap();
        assert_eq!(
            result,
            vec![db::Post {
                id: -1,
                link: "https://tomcritchlow.com/2019/11/18/yes-and/".to_string(),
                title: "Yes, And – How to be effective in the theatre of work".to_string(),
                date: "2019-11-30T12:47:19"
                    .parse::<chrono::NaiveDateTime>()
                    .unwrap(),
                summary: Some(
                    r#"<a href="https://news.ycombinator.com/item?id=21669726">Comments</a>"#
                        .to_string()
                ),
                content: None,
                media_type: None,
                media_link: None,
                comments_link: Some("https://news.ycombinator.com/item?id=21669726".to_string()),
            }]
        );
    }

    #[test]
    fn test_parse_rss_stopgame() {
        let content = include_str!("snapshots/rss_stopgame.xml").to_string();
        let result = parse(&content).unwrap();
        assert_eq!(
            result,
            vec![db::Post {
                id: -1,
                link: "https://stopgame.ru/newsdata/41005".to_string(),
                title: "Результаты опроса сообщества Ghost Recon: Breakpoint — чего игроки хотят в первую очередь".to_string(),
                date: "2019-11-30T14:55:03"
                    .parse::<chrono::NaiveDateTime>()
                    .unwrap(),
                summary: Some("<b>Ghost Recon: Breakpoint</b> стала".to_string()),
                content: None,
                media_type: Some(db::MediaType { mime: "image/jpeg".to_string() }),
                media_link: Some("https://images.stopgame.ru/news/2019/11/30/AwQ7-p3_W.jpg".to_string()),
                comments_link: Some("https://stopgame.ru/newsdata/41005#comments".to_string()),
            }]
        );
    }

    #[test]
    fn test_parse_rss_kotlin() {
        let content = include_str!("snapshots/rss_kotlin.xml").to_string();
        let result = parse(&content).unwrap();
        assert_eq!(
            result,
            vec![db::Post {
                id: -1,
                link: "https://blog.jetbrains.com/kotlin/2019/11/kotlin-1-3-60-released/"
                    .to_string(),
                title: "Kotlin 1.3.60 Released".to_string(),
                date: "2019-11-18T16:45:58"
                    .parse::<chrono::NaiveDateTime>()
                    .unwrap(),
                summary: Some(
                    "Description We’re happy to present the new release today, Kotlin 1.3.60."
                        .to_string()
                ),
                content: Some(
                    "<p>Content We’re happy to present the new release today, Kotlin 1.3.60.</p>"
                        .to_string()
                ),
                media_type: None,
                media_link: None,
                comments_link: Some(
                    "https://blog.jetbrains.com/kotlin/2019/11/kotlin-1-3-60-released/#comments"
                        .to_string()
                ),
            }]
        );
    }

    #[test]
    fn test_parse_date_handle_negative_zero_timezone() {
        let expected =
            chrono::NaiveDateTime::parse_from_str("2019-12-04T05:00:00", "%Y-%m-%dT%H:%M:%S%.f")
                .unwrap();
        assert_eq!(
            expected,
            parse_date("Wed, 04 Dec 2019 05:00:00 -0000").unwrap()
        );
    }
}
