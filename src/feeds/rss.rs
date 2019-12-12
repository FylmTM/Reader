use crate::db::{Feed, MediaType, Post};
use crate::error::{ApplicationError, Error, Result};
use crate::feeds::utils::{clean_to_safe_html, clean_to_text, find_image, get_url_content};

pub fn update(feed: &Feed) -> Result<Vec<Post>> {
    let content = get_url_content(&feed.feed)?;
    let posts = parse(&content)?;

    Ok(posts)
}

fn parse(content: &str) -> Result<Vec<Post>> {
    let channel = content.parse::<rss::Channel>()?;
    let mut posts = Vec::with_capacity(channel.items().len());

    for item in channel.items() {
        let link = item
            .link()
            .ok_or(Error::App(ApplicationError::RSSParsingMissingItemLink))?
            .to_string();
        let unique_id = item
            .guid()
            .map(|guid| guid.value().to_string())
            .unwrap_or_else(|| link.clone());
        let title = item
            .title()
            .ok_or(Error::App(ApplicationError::RSSParsingMissingItemTitle))?
            .to_string();
        let date = match item.pub_date() {
            Some(date) => parse_date(date)?,
            None => chrono::DateTime::from(chrono::Utc::now()),
        };

        let summary = item.description().map(clean_to_text);
        let content = item
            .content()
            .or(item.description())
            .map(|content| clean_to_safe_html(content, &link));
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
                        Some(MediaType {
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
                find_image(content)
                    .map(|image| {
                        (
                            Some(MediaType {
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

        let post = Post {
            id: -1, // Post is not retrieved from database
            unique_id,
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
        let content = include_str!("../../static/mock/rss/hacker_news.xml");
        let result = parse(content).unwrap();
        assert_debug_snapshot!(result);
    }

    #[test]
    fn test_parse_rss_kotlin() {
        let content = include_str!("../../static/mock/rss/kotlin.xml");
        let result = parse(content).unwrap();
        assert_debug_snapshot!(result);
    }

    #[test]
    fn test_parse_rss_react() {
        let content = include_str!("../../static/mock/rss/react.xml");
        let result = parse(content).unwrap();
        assert_debug_snapshot!(result);
    }

    #[test]
    fn test_parse_rss_stopgame() {
        let content = include_str!("../../static/mock/rss/stopgame.xml");
        let result = parse(content).unwrap();
        assert_debug_snapshot!(result);
    }

    #[test]
    fn test_parse_rss_xkcd() {
        let content = include_str!("../../static/mock/rss/xkcd.xml");
        let result = parse(content).unwrap();
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
