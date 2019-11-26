create table users
(
    id       integer primary key,
    username text,
    api_key  text unique
);

create table feeds
(
    id         integer primary key,
    type       text not null,
    identifier text not null
);

create table user_feeds
(
    user_id integer references users (id) not null,
    feed_id integer references feeds (id) not null
);
