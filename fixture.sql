-- This is test fixture, that is intended to be used for development & testing.
-- Default configuration should pick this one up.
-- Feeds here have special URL that point to their mocked versions.

insert or ignore into feeds(id, kind, title, link, feed)
values (1, 'RSS', 'Hacker News (default)', 'https://news.ycombinator.com', 'http://127.0.0.1:8080/mock/rss/hacker_news.xml'),
       (2, 'RSS', 'xkcd (default)', 'https://xkcd.com', 'http://127.0.0.1:8080/mock/rss/xkcd.xml'),
       (3, 'RSS', 'StopGame (default)', 'https://stopgame.ru/', 'http://127.0.0.1:8080/mock/rss/stopgame.xml'),
       (4, 'RSS', 'Kotlin Blog (default)', 'https://blog.jetbrains.com/kotlin/', 'http://127.0.0.1:8080/mock/rss/kotlin.xml'),
       (5, 'RSS', 'React.js (default)', 'https://reactjs.org', 'http://127.0.0.1:8080/mock/rss/react.xml'),
       (6, 'Atom', 'GitHub Rocket Releases', 'https://github.com/SergioBenitez/Rocket/releases', 'http://127.0.0.1:8080/mock/atom/github_rocket_releases.atom'),
       (7, 'Atom', 'Golang Blog', 'https://blog.golang.org', 'http://127.0.0.1:8080/mock/atom/golang.atom'),
       (8, 'Atom', 'Julia Evans', 'https://jvns.ca', 'http://127.0.0.1:8080/mock/atom/julia_evans.atom'),
       (9, 'Atom', 'Rust Blog', 'https://blog.rust-lang.org/', 'http://127.0.0.1:8080/mock/atom/rust.atom')
;

insert or ignore into users(id, username, api_key)
values (1, 'me', 'api_key')
;

insert or ignore into user_categories(id, user_id, title)
values (1, 1, 'General'),
       (2, 1, 'Development')
;

insert or ignore into user_category_feeds(category_id, feed_id, title)
values (1, 1, 'Hacker News'),
       (1, 2, 'xkcd'),
       (1, 3, 'StopGame'),
       (2, 4, 'Kotlin Blog'),
       (2, 5, 'React.js'),
       (2, 6, 'GitHub Rocket Releases'),
       (2, 7, 'Golang Blog'),
       (2, 8, 'Julia Evans'),
       (2, 9, 'Rust Blog')
;
