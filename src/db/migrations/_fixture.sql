insert or ignore into users(id, username, api_key)
values (1, 'me', 'api_key');

insert or ignore into categories(id, user_id, name)
values (1, 1, 'General');

insert or ignore into feeds(id, kind, title, link, feed)
values (1, 'RSS', 'Hacker News', 'https://news.ycombinator.com', 'https://news.ycombinator.com/rss');

insert or ignore into category_feeds(category_id, feed_id)
values (1, 1);
