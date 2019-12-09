lazy_static! {
    static ref AMMONIA_ONLY_TEXT: ammonia::Builder<'static> = {
        let mut builder = ammonia::Builder::default();
        builder.tags(std::collections::HashSet::new());
        builder
    };
}

pub fn clean_to_text(html: &str) -> String {
    AMMONIA_ONLY_TEXT.clean(html).to_string()
}

pub fn clean_to_safe_html(html: &str) -> String {
    ammonia::clean(html)
}
