# Troubleshooting

## Reverse proxy
Be aware of issues behind a Nginx reverse proxy:
- https://help.nextcloud.com/t/nginx-reverse-proxy-what-to-write-in-nextclouds-config-php/9149/31
- https://help.nextcloud.com/t/connection-wizard-is-looping-between-log-in-and-grant-access/46809

## Upgrade Nextcloud database
When you upgrade Nextcloud, you often need to upgrade the database schema. As the MariaDB isn't running in the same container, you will need to do a manual upgrade.
```bash
docker exec -it --user www-data addon_local_nextcloud /bin/bash
cd /share/nextcloud/html
php occ maintenance:mode --on
php occ upgrade
php occ maintenance:mode --off
```
See https://docs.nextcloud.com/server/latest/admin_manual/maintenance/manual_upgrade.html for more informations.

If a message about major and minor versions pops up, comment the lines (around 210) of `lib/private/Updater.php` to skip the version check.
