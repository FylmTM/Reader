insert or ignore into users(id, username, api_key)
values (1, 'me', 'api_key');

insert or ignore into categories(id, user_id, name)
values (1, 1, 'General');

insert or ignore into feeds(id, kind, title, link, feed)
values (1, 'RSS', 'Test RSS feed', 'http://127.0.0.1:18080/rss_feed.xml', 'http://127.0.0.1:18080/rss_feed.xml');

insert or ignore into category_feeds(category_id, feed_id)
values (1, 1);
