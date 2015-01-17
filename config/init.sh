#!/bin/sh
cd /app/src
export COMPOSER_HOME="/root"
composer install --no-interaction
composer dump-autoload --optimize

php app/console mediamine:oauth:client:create \
    --redirect-uri="http://localhost:8080/" \
    --grant-type="authorization_code" \
    --grant-type="password" \
    --grant-type="refresh_token" \
    --grant-type="token" \
    --grant-type="client_credentials" > web/client.json

chmod -R 777 /app/src/app/cache/
chmod -R 777 /app/src/app/logs/

mkdir -p /etc/service/task_2
echo "#!/bin/sh
cd /app/src
php app/console rabbitmq:consumer --no-debug --env=prod -m 100 task >> app/logs/consumers.log 2>&1" | tee /etc/service/task_2/run
chmod 755 /etc/service/task_2/run

mkdir -p /etc/service/task_3
echo "#!/bin/sh
cd /app/src
php app/console rabbitmq:consumer --no-debug --env=prod -m 100 task >> app/logs/consumers.log 2>&1" | tee /etc/service/task_3/run
chmod 755 /etc/service/task_3/run

mkdir -p /etc/service/task_4
echo "#!/bin/sh
cd /app/src
php app/console rabbitmq:consumer --no-debug --env=prod -m 100 task >> app/logs/consumers.log 2>&1" | tee /etc/service/task_4/run
chmod 755 /etc/service/task_4/run