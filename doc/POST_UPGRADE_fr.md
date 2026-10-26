### Mettez aussi PHP à jour

Le 21 octobre 2026, PHP a corrigé deux failles critiques (CVE-2026-109618 et
CVE-2026-109619) qui permettent d'exécuter du code à distance sur toute installation PHP
exposée au web. Sous YunoHost, c'est le PHP du système qui sert OpenLMNP : la mise à jour du
paquet ne le remplace pas.

Vérifiez que votre serveur utilise **PHP 8.4.27 ou plus récent** :

```bash
php8.4 -v
```

Sinon, appliquez les mises à jour système depuis l'administration de YunoHost (« Mises à
jour du système »), ou avec `sudo apt update && sudo apt upgrade`.
