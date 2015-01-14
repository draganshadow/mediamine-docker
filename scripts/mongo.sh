#!/bin/sh
echo "########################################################"
echo "Starting mongo"
exec /usr/bin/mongod --config /app/config/mongo/mongodb.conf
echo "########################################################"