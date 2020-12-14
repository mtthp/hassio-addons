# Hass.io Add-ons: Nextcloud

Self-hosted file share and collaboration platform on the web.

## About

Nextcloud is a suite of client-server software for creating and using file hosting services.
Nextcloud application functionally is similar to Dropbox.
Unlike Dropbox, Nextcloud does not offer off-premises file storage hosting.

A safe home for all your data. Access & share your files, calendars, contacts, mail
& more from any device, on your terms.

## Requirements
- Home Assistant
- MYSQL Server with a database and user

## Config
- Add a user/database for Nextcloud to your MYSQL.
If you use the MariaDB-Addon you can create a new user in the Addon-Config.

Example Config:
```yaml
databases:
  - homeassistant
  - nextcloud
logins:
  - username: homeassistant
    password: YOURPASSWORD
  - username: nextcloud
    password: YOURPASSWORD
rights:
  - username: homeassistant
    database: homeassistant
  - username: nextcloud
    database: nextcloud
```

- Configure Nextcloud addon accordingly :

```yaml
MYSQL_DATABASE: nextcloud                         # The Database you created in step above.
MYSQL_USER: nextcloud                             # The User you created in step above.
MYSQL_PASSWORD: aRandomPassword                   # The Password you created in step above.
MYSQL_HOST: addon_core_mariadb                    # The Host of your SQL-Server. The default port is 3306.
NEXTCLOUD_ADMIN_USER: someUsername                # The User for your Nextcloud-instance.
NEXTCLOUD_ADMIN_PASSWORD: somePassword            # The Password for your Nextcloud-instance.
NEXTCLOUD_TABLE_PREFIX: nc_                       # The Database prefix for your Nextcloud-instance.
NEXTCLOUD_TRUSTED_DOMAINS: cloud.yourdomain.com   # The Domain for your Nextcloud-instance. Can also be a local IP for local access i.e: 192.168.178.5. Theses can be
```
This list is not exhaustive. The documentation for env variables can be found at https://github.com/docker-library/docs/blob/master/nextcloud/README.md#auto-configuration-via-environment-variables.
Do not forget to map a port to your host.

## Start

- Start the addon. Wait a while and check the log for any errors.
- Open yourdomain.com:8888 (where ":8888" is the port configured in the Nextcloud addon).

### SSL

- Add SSL with something like [Nginx Proxy Manager addon](https://github.com/hassio-addons/addon-nginx-proxy-manager) for example with the Port from step above.
- Enjoy Nextcloud with SSL and without adding ":8888" to your Domain.

## Troubleshooting

If you have in issue with your installation, please be sure to checkout the [TROUBLESHOOT](https://github.com/mtthp/hassio-addons/blob/master/nextcloud/TROUBLESHOOT.md) guide before opening an issue.
