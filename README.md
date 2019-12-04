Reader
======

**Reader** is simple, small and fast news aggregator.

* Multiple [sources](#sources).
* [Fast](#benchmarks).
* Low CPU and memory usage.
* Sensible default [configuration](#configuration).
* Available as a [single static binary](#deployment).

### Features

- [ ] Web UI
- [ ] Organize feeds in categories
- [ ] Read later
- [ ] Search
- [ ] Shortcuts
- [ ] OPML Import/Export
- [ ] Old posts cleanup
- [ ] Rotten feeds
- [ ] API documentation

**Supported browsers:** latest versions of Chrome, Firefox, Edge, Safari.

### Sources

- [ ] RSS
- [ ] Atom
- [ ] Github
- [ ] StackOverflow
- [ ] Reddit
- [ ] Hacker News
- [ ] Twitter

## Quickstart

WIP.

## Configuration

WIP.

## Deployment

WIP.

## Benchmarks

WIP.

## Development

**Requirements:**

* Rust nightly (install via [rustup](https://rustup.rs/)).
* [Cargo make](https://github.com/sagiegurari/cargo-make)
* [Node](https://nodejs.org)
* [Yarn](https://yarnpkg.com)

```sh
rustup default nightly
cargo install cargo-make
```

Build process is orchestrated by `cargo make`.
Check [Makefile.toml](./Makefile.toml) to find out details behind these command.

**Build release:**

```sh
cargo make build
```

**Verify:**

```sh
cargo make verify
```

**Verify (with auto-formatting and auto-fix):**

```sh
cargo make fix
# or
cargo make
```

## License

Licensed under [GNU General Public License v3.0](https://github.com/FylmTM/Reader/blob/master/LICENSE).
