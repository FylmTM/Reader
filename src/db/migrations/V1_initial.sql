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
    identifier text not null,
    config     text not null
);

create table posts
(
    id    integer primary key,
    title text not null,
    body  text not null
);
