# Infrastructure

Below are notes on how to deploy and operate Reader.
They are based on my experience of deploying Reader to DigitalOcean droplet.

You don't need to follow them. Reader is just a single static binary, so it can be hosted whenever you want, however you want.

## Deployment

There is `deploy` task in [Makefile.toml](/Makefile.toml) which I use.

There is also a systemd unit [reader.service](./reader.service) example.

**View logs:**

```
# View logs in reverse order
journalctl -u reader -r

# Follow logs
journalctl -u reader -f 

# View last n entires
journalctl -u reader -n 100

# View error messages for last day
journalctl --since "24 hours ago" | grep ERROR
```

## Database

Reader is using SQLite as a database, by default created as `db.sqlite` in directory where reader was started.

To backup database, simply copy this file somewhere safe. This can be useful when updating Reader.
