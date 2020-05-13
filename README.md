# Hass.io Add-ons for Home Assistant

### [Nextcloud](nextcloud)

A safe home for all your data. Access & share your files, calendars, contacts, mail & more from any device, on your terms.

## Requirements
- Home Assistant
- MYSQL Server with a database and user

## Install
These add-ons can be installed in Home Assistant by [configuring the following URL in the Hass.io panel](https://home-assistant.io/hassio/installing_third_party_addons/):

```txt
https://github.com/mtthp/hassio-addons
```
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

- Configure Nextcloud-Addon. Also set the Port for your instance.
```yaml
MYSQL_DATABASE: nextcloud                         ##The Database you created in step above.
MYSQL_USER: nextcloud                             ##The User you created in step above.
MYSQL_PASSWORD: YOURPASSWORD                      ##The Password you created in step above.
MYSQL_HOST: '192.168.178.5:3306'                  ##The Host of your SQL-Server. You can set Port 3306 (or any other) in MariaDB-Config and use the IP of the Host system if you not sure what you're doing.
NEXTCLOUD_ADMIN_USER: YOURUSERNAME                ##The User for your Nextcloud-instance.
NEXTCLOUD_ADMIN_PASSWORD: YOURPASSWORD!           ##The Password for your Nextcloud-instance.
NEXTCLOUD_TABLE_PREFIX: nc_                       ##The Database prefix for your Nextcloud-instance.
NEXTCLOUD_TRUSTED_DOMAINS: cloud.yourdomain.com   ##The Domain for your Nextcloud-instance. Can also be a local IP for local access i.e: 192.168.178.5
```

- Start the Addon. Wait a while and check the Log for any Errors.
- Open yourdomain.com:8888 (where ":8888" is the Port configured in the Nextcloud Addon).
- Add SSL with something like Nginx Proxy Manager Addon for example with the Port from step above.
- Enjoy Nextcloud with SSL and without adding ":8888" to your Domain.

### [Nextcloud](nextcloud)

A safe home for all your data. Access & share your files, calendars, contacts, mail & more from any device, on your terms.

## Acknowledgement

- [Patrick Streule](https://github.com/pstreule) for the [README](https://github.com/pstreule/hassio-addons/blob/master/README.md)
