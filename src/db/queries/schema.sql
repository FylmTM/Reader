create table if not exists posts
(
    id    integer primary key,
    title text not null,
    body  text not null
);
