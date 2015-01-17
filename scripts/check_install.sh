#!/bin/bash
sleep 60s
if [ ! -f /app/src/app/bootstrap.php.cache ]; then
    /app/config/init.sh
else
    sleep 12h
fi