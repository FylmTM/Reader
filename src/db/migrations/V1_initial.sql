create table feeds
(
    id    integer primary key,

    kind  text not null,
    feed  text not null,
    title text not null,
    link  text not null,

    unique (kind, feed)
);

create table posts
(
    id            integer primary key autoincrement,
    feed_id       integer references feeds (id) not null,

    link          text                          not null,
    title         text                          not null,
    date          text                          not null,
    summary       text                          null,
    content       text                          null,
    media_type    text                          null,
    media_link    text                          null,
    comments_link text                          null,

    unique (feed_id, link)
);

create table users
(
    id       integer primary key,

    username text not null,
    api_key  text not null unique
);

create table user_categories
(
    id      integer primary key,
    user_id integer references users (id) not null,

    title   text                          not null
);

create table user_category_feeds
(
    category_id integer references user_categories (id) not null,
    feed_id     integer references feeds (id)           not null,

    title       text                                    not null,

    primary key (category_id, feed_id)
);

create table user_posts
(
    user_id       integer references users (id) not null,
    post_id       integer references posts (id) not null,

    is_read       boolean default (false) not null,
    is_read_later boolean default (false) not null,
    read_date     text                          null,

    primary key (user_id, post_id),
    check ( (is_read = false and read_date is null) or (is_read = true and read_date is not null) )
);
