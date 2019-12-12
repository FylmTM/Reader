use crate::db::{Feed, MediaType, Post};
use crate::error::{ApplicationError, Error, Result};
use crate::feeds::utils::{clean_to_safe_html, clean_to_text, find_image, get_url_content};

pub fn update(feed: &Feed) -> Result<Vec<Post>> {
    let content = get_url_content(&feed.feed)?;
    let posts = parse(&content)?;
    Ok(posts)
}

fn parse(content: &str) -> Result<Vec<Post>> {
    let feed = content.parse::<atom_syndication::Feed>()?;
    let mut posts = Vec::with_capacity(feed.entries().len());

    for entry in feed.entries() {
        let unique_id = entry.id().to_string();
        let link = entry
            .links()
            .iter()
            .find(|link| link.rel() == "alternate")
            .or_else(|| entry.links().get(0))
            .map(|link| link.href())
            .ok_or(Error::App(ApplicationError::AtomParsingMissingEntryLink))?
            .to_string();
        let title = entry.title().to_string();
        let date = parse_date(entry.published().unwrap_or(entry.updated()))?;
        let summary = entry.summary().map(clean_to_text);
        let content = entry
            .content()
            .and_then(|content| content.value())
            .or(entry.summary())
            .map(|content| clean_to_safe_html(content, &link));
        let comments_link = None;

        let (media_type, media_link) = {
            content
                .as_ref()
                .and_then(|content| find_image(content))
                .map(|image| {
                    (
                        Some(MediaType {
                            mime: "image/*".to_string(),
                        }),
                        Some(image),
                    )
                })
                .unwrap_or((None, None))
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
    let result =
        chrono::DateTime::parse_from_rfc3339(date).map(|date| chrono::DateTime::from(date))?;

    Ok(result)
}

#[cfg(test)]
mod tests {
    use crate::feeds::atom::parse;

    #[test]
    fn test_parse_atom_github_rocket_releases() {
        let content = include_str!("../../static/mock/atom/github_rocket_releases.atom");
        let result = parse(&content).unwrap();
        assert_debug_snapshot!(result);
    }

    #[test]
    fn test_parse_atom_golang() {
        let content = include_str!("../../static/mock/atom/golang.atom");
        let result = parse(&content).unwrap();
        assert_debug_snapshot!(result);
    }

    #[test]
    fn test_parse_atom_julia_evans() {
        let content = include_str!("../../static/mock/atom/julia_evans.atom");
        let result = parse(&content).unwrap();
        assert_debug_snapshot!(result);
    }

    #[test]
    fn test_parse_atom_rust() {
        let content = include_str!("../../static/mock/atom/rust.atom");
        let result = parse(&content).unwrap();
        assert_debug_snapshot!(result);
    }
}
