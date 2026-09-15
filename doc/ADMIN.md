## Where the data is

Everything lives in the install directory:

- `database/database.sqlite` — the accounting itself;
- `storage/app/` — the uploaded receipts;
- `.env` — the settings, including the application key.

All three are included in YunoHost backups and none is touched by upgrades. The backup also
carries a consistent snapshot of the database taken with `VACUUM INTO`, which is what gets
restored: a file-level copy of a live SQLite database can be caught mid-write.

## Changing a setting

Edit `.env` in the install directory, then clear the cache:

```bash
sudo -u __APP__ php__PHP_VERSION__ __INSTALL_DIR__/artisan optimize:clear
```

Useful keys:

| Key | What it does |
|---|---|
| `ALLOW_REGISTRATION` | `false` (default) closes sign-up. Set to `true` to let a second person create an account — each account only sees its own properties and entries |
| `MAIL_MAILER` | `sendmail` (default) goes through this server's own mail system. `smtp` plus the `MAIL_*` keys relays through an external provider |
| `TELEMETRY_ENABLED` | Whatever you answered at install. `true` sends one anonymous check-in a day — a random identifier and the version number — to count installations. `false` stops every outbound request |
| `APP_LOCALE` | The interface is French only; leave it alone |

## Accounts

The administrator account was created during the installation, with the e-mail address of
the YunoHost user you chose. To reset a password from the server:

```bash
sudo -u __APP__ php__PHP_VERSION__ __INSTALL_DIR__/artisan openlmnp:reset-password you@example.com
```

Add `--password="…"` to set one directly instead of printing a reset link.

## Updates

Through YunoHost only — the admin interface, or `yunohost app upgrade __APP__`. The
application's own in-place updater is disabled on purpose: it would rewrite files that
YunoHost manages, with tools that are not on the app user's PATH, and stop halfway.

Upgrades keep `.env`, the database and the receipts, and run the new database migrations.

## The scheduler

`/etc/cron.d/__APP__` runs Laravel's scheduler every minute. On this installation it does
very little: the daily install counter if you enabled it, and a weekly refresh of the public
land-value data used to estimate a property's market value.

## Logs

- Application: `__INSTALL_DIR__/storage/logs/`
- PHP-FPM: `journalctl -u php__PHP_VERSION__-fpm`
- Web server: `/var/log/nginx/`

## Several instances

The package is multi-instance: a second installation gets its own directory, system user,
PHP-FPM pool and database. Useful for keeping two sets of books apart — a couple filing
separately, for instance.
