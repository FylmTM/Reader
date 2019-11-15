# Reader

## Development

```
# If intsalling on 
cargo install diesel_cli --no-default-features --features sqlite
```

### SQLite

### Windows

Use [vcpkg](https://github.com/microsoft/vcpkg) to install development libraries.

```
./vcpkg install sqlite3:x64-windows
```

Any further compilations will require `VCPKGRS_DYNAMIC=1` environment variable set.
