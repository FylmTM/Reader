insert or ignore into users(id, username, api_key)
values (1, 'me', 'api_key')
;

insert or ignore into categories(id, user_id, name)
values (1, 1, 'General'),
       (2, 1, 'Development')
;

insert or ignore into feeds(id, kind, title, link, feed)
values (1, 'RSS', 'Hacker News', 'https://news.ycombinator.com', 'http://127.0.0.1:8080/mock/rss/hacker_news.xml'),
       (2, 'RSS', 'xkcd', 'https://xkcd.com', 'http://127.0.0.1:8080/mock/rss/xkcd.xml'),
       (3, 'RSS', 'StopGame', 'https://stopgame.ru/', 'http://127.0.0.1:8080/mock/rss/stopgame.xml'),
       (4, 'RSS', 'Kotlin Blog', 'https://blog.jetbrains.com/kotlin/', 'http://127.0.0.1:8080/mock/rss/kotlin.xml'),
       (5, 'RSS', 'React.js', 'https://reactjs.org', 'http://127.0.0.1:8080/mock/rss/react.xml')
;

insert or ignore into category_feeds(category_id, feed_id)
values (1, 1),
       (1, 2),
       (1, 3),
       (2, 4),
       (2, 5)
;
