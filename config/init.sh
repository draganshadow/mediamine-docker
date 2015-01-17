#!/bin/sh
cd /app/src
export COMPOSER_HOME="/root"
composer install --no-interaction

php app/console mediamine:oauth:client:create \
    --redirect-uri="http://localhost:8080/" \
    --grant-type="authorization_code" \
    --grant-type="password" \
    --grant-type="refresh_token" \
    --grant-type="token" \
    --grant-type="client_credentials" > web/client.json