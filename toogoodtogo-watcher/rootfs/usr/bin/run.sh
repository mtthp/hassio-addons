#!/usr/bin/with-contenv bashio
set +u

CONFIG_PATH=/data/options.json
DEST_PATH=/home/node/app/config.defaults.json
cp $CONFIG_PATH $DEST_PATH
chmod 777 $DEST_PATH

cd /home/node/app
node index.js watch
