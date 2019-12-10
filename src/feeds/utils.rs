lazy_static! {
    static ref AMMONIA_TEXT: ammonia::Builder<'static> = {
        let mut builder = ammonia::Builder::default();
        builder.tags(std::collections::HashSet::new());
        builder
    };
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
