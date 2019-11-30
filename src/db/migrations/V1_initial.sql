create table users
(
    id       integer primary key,

    username text not null,
    api_key  text not null unique
);

create table categories
(
    id      integer primary key,
    user_id integer references users (id) not null,

    name    text                          not null
);

create table category_feeds
(
    category_id integer references categories (id) not null,
    feed_id     integer references categories (id) not null,

    primary key (category_id, feed_id)
);

create table feeds
(
    id    integer primary key,

    type  text not null,
    link  text not null,
    title text not null,

    unique (type, link)
);

create table user_feeds
(
    user_id integer references users (id) not null,
    feed_id integer references feeds (id) not null,

    primary key (user_id, feed_id)
);

create table posts
(
    id      integer primary key,
    feed_id integer references feeds (id) not null,

    link    text                          not null,
    title   text                          not null,
    date    text                          not null,

    unique (feed_id, link)
);

create table user_posts
(
    -- id is used for ordering, therefore autoincrement is used to prevent reuse of ROWID's from previously deleted rows.
    id          integer primary key autoincrement,
    -- all ids are present here to avoid joining tables to retrieve posts
    -- it is application responsibility to update category_id on feed move
    user_id     integer references users (id)      not null,
    category_id integer references categories (id) not null,
    feed_id     integer references feeds (id)      not null,
    post_id     integer references posts (id)      not null,

    is_read     boolean default (false) not null,
    read_date   text                               null,

    unique (user_id, category_id, feed_id, post_id)
);
