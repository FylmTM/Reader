create table if not exists schema_version
(
    id      integer primary key,
    version integer
);

insert or ignore into schema_version(id, version)
values (1, 0);
