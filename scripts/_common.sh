#!/bin/bash

#=================================================
# COMMON VARIABLES AND CUSTOM HELPERS
#=================================================

# Every artisan call must run as the app user with the PHP version pinned by the manifest:
# the system "php" is Debian's, which the composer platform check rejects.
# artisan resolves the application root from its own location, so no cd is needed.
artisan() {
    ynh_exec_as_app "php$php_version" "$install_dir/artisan" "$@"
}
