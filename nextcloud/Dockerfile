ARG BUILD_FROM
FROM ${BUILD_FROM}

# Copy root filesystem
COPY rootfs /

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y jq smbclient \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache

# Change the root folder for Nextcloud to the /share directory to be persistent
RUN  sed -i "s|/var/www|/share/nextcloud|g" /etc/apache2/sites-enabled/000-default.conf \
  && sed -i "s|/var/www|/share/nextcloud|g" /etc/apache2/apache2.conf \
  && sed -i "s|/var/www/html|/share/nextcloud/html|g" /entrypoint.sh \
  && sed -i "s|/var/www/html|/share/nextcloud/html|g" /usr/src/nextcloud/config/autoconfig.php

RUN echo "ServerName localhost" | tee /etc/apache2/conf-available/fqdn.conf && a2enconf fqdn

ENTRYPOINT [ "/usr/bin/run.sh" ]
CMD ["apache2-foreground"]

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="Nextcloud" \
    io.hass.description="Nextcloud add-on by Matthieu Petit" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Matthieu Petit <p.matthieu@me.com>" \
    org.label-schema.description="Nextcloud add-on by Matthieu Petit" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="Nextcloud" \
    org.label-schema.schema-version="1.0.0" \
    org.label-schema.url="https://github.com/mtthp/hassio-addons" \
    org.label-schema.usage="https://github.com/mtthp/hassio-addons/tree/master/nextcloud/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/mtthp/hassio-addons/" \
    org.label-schema.vendor="mtthp Hass.io Add-ons"
