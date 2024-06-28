#!/bin/bash

function install_modules() {
    if [ ! -d "/mnt/extra-addons/session_redis" ];
    then 
        git clone --recurse-submodules --branch 17.0 https://github.com/camptocamp/odoo-cloud-platform.git /mnt/extra-addons/
        /entrypoint.sh odoo -d production_odoo --max-cron-threads 0 --no-http --stop-after-init -i session_redis
        /entrypoint.sh odoo shell -d production_odoo --max-cron-threads 0 --stop-after-init --no-http < /start_script.py 
        exit 0
    else
        /entrypoint.sh odoo
    fi
}
install_modules
exit 0
