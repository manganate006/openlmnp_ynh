Your administrator account has been created with the e-mail address of the YunoHost user you
selected and the password you chose. Public sign-up is closed (`ALLOW_REGISTRATION=false` in
`__INSTALL_DIR__/.env`); open it there if a second person needs an account on this instance.

A few things worth knowing:

- **E-mails are not sent by default.** `MAIL_MAILER=log` writes them to
  `__INSTALL_DIR__/storage/logs/`, so the "forgot password" link does nothing useful yet.
  Either fill in the `MAIL_*` settings in `.env`, or reset a password from the server:
  `cd __INSTALL_DIR__ && sudo -u __APP__ php artisan openlmnp:reset-password you@example.com`
- **Your data lives in `__INSTALL_DIR__`**: the accounting itself in
  `database/database.sqlite`, the uploaded receipts in `storage/app/`. Both are included in
  YunoHost backups, and neither is touched by upgrades.
- **The application counts installations**, once a day, with a random identifier and the
  version number — nothing else. Set `TELEMETRY_ENABLED=false` in `.env` to stop every
  outbound request.
- **After editing `.env`**, run `cd __INSTALL_DIR__ && sudo -u __APP__ php artisan optimize:clear`.
