Your administrator account has been created with the e-mail address of the YunoHost user you
selected and the password you chose. Public sign-up is closed (`ALLOW_REGISTRATION=false` in
`__INSTALL_DIR__/.env`); open it there if a second person needs an account on this instance.

A few things worth knowing:

- **E-mails go through this server's own mail system**, so the "forgot password" link works
  out of the box. To relay through an external provider instead, set `MAIL_MAILER=smtp` and
  the `MAIL_*` settings in `.env`. You can also reset a password from the server:
  `sudo -u __APP__ php__PHP_VERSION__ __INSTALL_DIR__/artisan openlmnp:reset-password you@example.com`
- **Your data lives in `__INSTALL_DIR__`**: the accounting itself in
  `database/database.sqlite`, the uploaded receipts in `storage/app/`. Both are included in
  YunoHost backups, and neither is touched by upgrades — nor is `.env`, so any setting you
  change there is kept.
- **Installation counting** is whatever you answered at install time
  (`TELEMETRY_ENABLED` in `.env`): once a day, a random identifier and the version number,
  nothing else. `false` stops every outbound request.
- **Updates go through YunoHost**, from the admin interface or with
  `yunohost app upgrade __APP__`. The application's own in-place updater is disabled on
  purpose: it would overwrite files that YunoHost manages.
- **After editing `.env`**, run
  `sudo -u __APP__ php__PHP_VERSION__ __INSTALL_DIR__/artisan optimize:clear`.
