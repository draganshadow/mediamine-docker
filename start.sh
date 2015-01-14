#!/bin/sh

docker stop mediamine
docker rm mediamine
docker run --name mediamine \
    -v /etc/mediamine/config:/app/config \
    -v /var/opt/mediamine:/app/db \
    -v /var/log/mediamine:/app/log \
    -v /tmp/mediamine/stream:/app/src/web/stream \
    -v /tmp/mediamine/resized:/app/src/web/images/resized \
    -v ~/Vidéos:/app/media/video \
    -d -p 80:80 \
    dragansadow/mediamine