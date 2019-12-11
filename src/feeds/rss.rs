use crate::db::{self};
use crate::error::{ApplicationError, Error, Result};
use crate::feeds::utils;

pub fn update(feed: &db::Feed) -> Result<Vec<db::Post>> {
    let content = get(&feed.feed)?;
    let posts = parse(&content)?;

    Ok(posts)
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
            None => chrono::DateTime::from(chrono::Utc::now()),
        };

        let summary = item.description().map(utils::clean_to_text);
        let content = item
            .content()
            .or(item.description())
            .map(|content| utils::clean_to_safe_html(content, &link));
        let comments_link = item.comments().map(String::from);

        let (media_type, media_link) = {
            if item.enclosure().is_some() {
                let enclosure = item.enclosure().unwrap();
                let media_type = {
                    let mime_type = enclosure.mime_type();
                    if mime_type.is_empty() {
                        None
                    } else if mime_type.parse::<mime::Mime>().is_err() {
                        None
                    } else {
                        Some(db::MediaType {
                            mime: mime_type.to_string(),
                        })
                    }
                };
                let media_link = {
                    let url = enclosure.url();
                    if url.is_empty() {
                        None
                    } else {
                        Some(url.to_string())
                    }
                };

                (media_type, media_link)
            } else if content.is_some() {
                // If there is no enclosure in feed, let's try to cut out first image from content
                let content = content.as_ref().unwrap();
                utils::find_image(content)
                    .map(|image| {
                        (
                            Some(db::MediaType {
                                mime: "image/*".to_string(),
                            }),
                            Some(image),
                        )
                    })
                    .unwrap_or((None, None))
            } else {
                (None, None)
            }
        };

        let post = db::Post {
            id: -1, // Post is not retrieved from database
            link,
            title,
            date,
            summary,
            content,
            media_type,
            media_link,
            comments_link,
        };
        posts.push(post);
    }

    // Items are sorted from newest to oldest, but for database insertion
    // we need them sorted from oldest to newest.
    posts.reverse();
    Ok(posts)
}

fn parse_date(date: &str) -> Result<chrono::DateTime<chrono::Utc>> {
    let result = chrono::DateTime::parse_from_rfc2822(date)
        .or_else(|_| {
            // chrono consider "-0000" timezone to be "missing"
            // We will blindly replace it with +0000 if it exists, and try to parse again.
            let date = date.replace("-0000", "+0000");
            chrono::DateTime::parse_from_rfc2822(&date)
        })
        .map(|date| chrono::DateTime::from(date))?;
    Ok(result)
}

#[cfg(test)]
mod tests {
    use crate::feeds::rss::{parse, parse_date};

    #[test]
    fn test_parse_rss_hacker_news() {
        let content = include_str!("../../static/mock/rss/hacker_news.xml").to_string();
        let result = parse(&content).unwrap();
        assert_debug_snapshot!(result);
    }

    #[test]
    fn test_parse_rss_kotlin() {
        let content = include_str!("../../static/mock/rss/kotlin.xml").to_string();
        let result = parse(&content).unwrap();
        assert_debug_snapshot!(result);
    }

    #[test]
    fn test_parse_rss_react() {
        let content = include_str!("../../static/mock/rss/react.xml").to_string();
        let result = parse(&content).unwrap();
        assert_debug_snapshot!(result);
    }

    #[test]
    fn test_parse_rss_stopgame() {
        let content = include_str!("../../static/mock/rss/stopgame.xml").to_string();
        let result = parse(&content).unwrap();
        assert_debug_snapshot!(result);
    }

    #[test]
    fn test_parse_rss_xkcd() {
        let content = include_str!("../../static/mock/rss/xkcd.xml").to_string();
        let result = parse(&content).unwrap();
        assert_debug_snapshot!(result);
    }

    #[test]
    fn test_parse_date_handle_negative_zero_timezone() {
        let expected = chrono::DateTime::parse_from_rfc3339("2019-12-04T05:00:00+00:00").unwrap();
        assert_eq!(
            expected,
            parse_date("Wed, 04 Dec 2019 05:00:00 -0000").unwrap()
        );
    }
}
