#!/bin/sh
cd /app/src
php app/console rabbitmq:consumer --no-debug --env=prod -m 1 job >> app/logs/consumers.log 2>&1