## Où vivent les données

Tout est dans le répertoire d'installation :

- `database/database.sqlite` — la comptabilité elle-même ;
- `storage/app/` — les justificatifs déposés ;
- `.env` — les réglages, dont la clé de chiffrement de l'application.

Les trois sont inclus dans les sauvegardes YunoHost et aucune mise à jour n'y touche. La
sauvegarde emporte en plus un instantané cohérent de la base, pris par `VACUUM INTO` : c'est
lui qui est restauré, une copie fichier d'une base SQLite en service pouvant être saisie en
pleine écriture.

## Modifier un réglage

Éditez `.env` dans le répertoire d'installation, puis videz le cache :

```bash
sudo -u __APP__ php__PHP_VERSION__ __INSTALL_DIR__/artisan optimize:clear
```

Les clés utiles :

| Clé | Effet |
|---|---|
| `ALLOW_REGISTRATION` | `false` (défaut) ferme l'inscription. `true` permet à une seconde personne de créer un compte — chaque compte ne voit que ses propres biens et écritures |
| `MAIL_MAILER` | `sendmail` (défaut) passe par la messagerie de cette machine. `smtp` et les clés `MAIL_*` relaient par un prestataire externe |
| `TELEMETRY_ENABLED` | Ce que vous avez répondu à l'installation. `true` envoie un signal anonyme par jour — un identifiant aléatoire et le numéro de version — pour compter les installations. `false` supprime toute requête sortante |
| `APP_LOCALE` | L'interface n'existe qu'en français ; n'y touchez pas |

## Comptes

Le compte administrateur a été créé pendant l'installation, avec l'adresse e-mail de
l'utilisateur YunoHost choisi. Pour réinitialiser un mot de passe depuis le serveur :

```bash
sudo -u __APP__ php__PHP_VERSION__ __INSTALL_DIR__/artisan openlmnp:reset-password vous@exemple.fr
```

Ajoutez `--password="…"` pour en fixer un directement au lieu d'afficher un lien.

## Mises à jour

Par YunoHost uniquement — l'administration, ou `yunohost app upgrade __APP__`. La mise à
jour automatique interne de l'application est désactivée volontairement : elle réécrirait
des fichiers gérés par YunoHost, avec des outils absents du PATH de l'utilisateur de l'app,
et s'arrêterait à mi-chemin.

Une mise à jour conserve `.env`, la base et les justificatifs, et applique les nouvelles
migrations.

## Le planificateur

`/etc/cron.d/__APP__` lance le planificateur de Laravel chaque minute. Sur cette
installation il fait peu de choses : le comptage quotidien si vous l'avez accepté, et un
rafraîchissement hebdomadaire des données publiques de valeurs foncières, utilisées pour
estimer la valeur d'un bien.

## Journaux

- Application : `__INSTALL_DIR__/storage/logs/`
- PHP-FPM : `journalctl -u php__PHP_VERSION__-fpm`
- Serveur web : `/var/log/nginx/`

## Plusieurs instances

Le paquet est multi-instance : une seconde installation reçoit son répertoire, son
utilisateur système, son pool PHP-FPM et sa base. Utile pour tenir deux comptabilités
séparées — un couple qui déclare séparément, par exemple.
