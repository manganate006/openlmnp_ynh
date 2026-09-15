Votre compte administrateur a été créé avec l'adresse e-mail de l'utilisateur YunoHost que
vous avez choisi et le mot de passe que vous avez saisi. L'inscription publique est fermée
(`ALLOW_REGISTRATION=false` dans `__INSTALL_DIR__/.env`) ; ouvrez-la là si une seconde
personne a besoin d'un compte sur cette instance.

Quelques points utiles :

- **Les e-mails partent par le serveur de messagerie de cette machine**, le lien « mot de
  passe oublié » fonctionne donc immédiatement. Pour passer par un prestataire externe,
  réglez `MAIL_MAILER=smtp` et les variables `MAIL_*` dans `.env`. Vous pouvez aussi
  réinitialiser un mot de passe depuis le serveur :
  `sudo -u __APP__ php__PHP_VERSION__ __INSTALL_DIR__/artisan openlmnp:reset-password vous@exemple.fr`
- **Vos données vivent dans `__INSTALL_DIR__`** : la comptabilité dans
  `database/database.sqlite`, les justificatifs déposés dans `storage/app/`. Les deux sont
  inclus dans les sauvegardes YunoHost et aucune mise à jour n'y touche — pas plus qu'à
  `.env`, vos réglages y sont donc conservés.
- **Le comptage des installations** correspond à ce que vous avez répondu à l'installation
  (`TELEMETRY_ENABLED` dans `.env`) : une fois par jour, un identifiant aléatoire et le
  numéro de version, rien d'autre. `false` supprime toute requête sortante.
- **Les mises à jour passent par YunoHost**, depuis l'administration ou avec
  `yunohost app upgrade __APP__`. La mise à jour automatique interne de l'application est
  désactivée volontairement : elle écraserait des fichiers gérés par YunoHost.
- **Après avoir modifié `.env`**, lancez
  `sudo -u __APP__ php__PHP_VERSION__ __INSTALL_DIR__/artisan optimize:clear`.
