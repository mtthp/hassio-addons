ARG BUILD_FROM
FROM ${BUILD_FROM}

ENV LANG C.UTF-8

# because the user is set to
# 'node' in marklagendijk/toogoodtogo-watcher
USER root

# Copy data for add-on
COPY rootfs /

ENTRYPOINT [ "/bin/sh", "/usr/bin/run.sh" ]
