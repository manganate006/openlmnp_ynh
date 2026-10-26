### Update PHP as well

On 21 October 2026, PHP fixed two critical vulnerabilities (CVE-2026-109618 and
CVE-2026-109619) that allow remote code execution on any PHP installation exposed to the
web. On YunoHost, OpenLMNP is served by the system PHP: upgrading this package does not
replace it.

Check that your server runs **PHP 8.4.27 or later**:

```bash
php8.4 -v
```

If not, apply the system updates from the YunoHost admin panel ("System update"), or run
`sudo apt update && sudo apt upgrade`.
