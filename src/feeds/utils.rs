use crate::error::{ApplicationError, Error, Result};

lazy_static! {
    static ref AMMONIA_TEXT: ammonia::Builder<'static> = {
        let mut builder = ammonia::Builder::default();
        builder.tags(std::collections::HashSet::new());
        builder
    };
}

pub fn get_url_content(link: &String) -> Result<String> {
    let mut response = reqwest::get(link)?;

    if response.status() != reqwest::StatusCode::OK {
        error!(
            "Failed to retrieve feed={} with status={}",
            link,
            response.status()
        );
        return Err(Error::App(ApplicationError::FailedGetUrlContent(
            link.clone(),
        )));
    }

    return Ok(response.text()?);
}

pub fn clean_to_text(html: &str) -> String {
    AMMONIA_TEXT.clean(html).to_string()
}

pub fn clean_to_safe_html(html: &str, base_url: &str) -> String {
    let mut builder = ammonia::Builder::default();
    builder.url_relative(ammonia::UrlRelative::RewriteWithBase(
        ammonia::Url::parse(base_url).expect("Failed to parse base url"),
    ));
    builder.clean(html).to_string()
}

pub fn find_image(html: &str) -> Option<String> {
    // language=RegExp
    let regexp = regex::Regex::new(r#"<img.*?src="(.+?)""#).unwrap();
    regexp
        .captures(html)
        .and_then(|captures| captures.get(1))
        .map(|src| src.as_str().to_string())
}
