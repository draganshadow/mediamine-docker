#!/bin/sh

docker stop mediamine
docker rm mediamine
docker run --name mediamine \
    -v /etc/mediamine/config:/app/config \
    -v /var/opt/mediamine:/app/db \
    -v /var/log/mediamine:/app/log \
    -v /tmp/mediamine/stream:/app/src/web/stream \
    -v /tmp/mediamine/resized:/app/src/web/images/resized \
    -v /tmp/mediamine/zip:/app/src/web/zip \
    -v ~/Vidéos:/app/media/video \
    -p 80:80 \
    -p 15672:15672 \
    -p 9200:9200 \
    -d draganshadow/mediamine