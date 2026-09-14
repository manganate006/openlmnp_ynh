Votre compte administrateur a été créé avec l'adresse e-mail de l'utilisateur YunoHost
choisi et le mot de passe que vous avez saisi. L'inscription publique est fermée
(`ALLOW_REGISTRATION=false` dans `__INSTALL_DIR__/.env`) ; ouvrez-la à cet endroit si une
deuxième personne doit avoir un compte sur cette instance.

Quelques points à connaître :

- **Aucun e-mail n'est envoyé par défaut.** `MAIL_MAILER=log` les écrit dans
  `__INSTALL_DIR__/storage/logs/`, le lien « mot de passe oublié » ne sert donc encore à rien.
  Renseignez les variables `MAIL_*` de `.env`, ou réinitialisez un mot de passe depuis le
  serveur :
  `cd __INSTALL_DIR__ && sudo -u __APP__ php artisan openlmnp:reset-password vous@exemple.fr`
- **Vos données vivent dans `__INSTALL_DIR__`** : la comptabilité dans
  `database/database.sqlite`, les justificatifs déposés dans `storage/app/`. Les deux sont
  inclus dans les sauvegardes YunoHost, et aucune mise à jour n'y touche.
- **L'application compte les installations**, une fois par jour, avec un identifiant
  aléatoire et le numéro de version — rien d'autre. `TELEMETRY_ENABLED=false` dans `.env`
  coupe toute requête sortante.
- **Après avoir modifié `.env`**, lancez
  `cd __INSTALL_DIR__ && sudo -u __APP__ php artisan optimize:clear`.
