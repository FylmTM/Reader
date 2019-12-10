insert or ignore into feeds(id, kind, title, link, feed)
values (1, 'RSS', 'Hacker News (default)', 'https://news.ycombinator.com', 'http://127.0.0.1:8080/mock/rss/hacker_news.xml'),
       (2, 'RSS', 'xkcd (default)', 'https://xkcd.com', 'http://127.0.0.1:8080/mock/rss/xkcd.xml'),
       (3, 'RSS', 'StopGame (default)', 'https://stopgame.ru/', 'http://127.0.0.1:8080/mock/rss/stopgame.xml'),
       (4, 'RSS', 'Kotlin Blog (default)', 'https://blog.jetbrains.com/kotlin/', 'http://127.0.0.1:8080/mock/rss/kotlin.xml'),
       (5, 'RSS', 'React.js (default)', 'https://reactjs.org', 'http://127.0.0.1:8080/mock/rss/react.xml')
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
       (2, 5, 'React.js')
;
