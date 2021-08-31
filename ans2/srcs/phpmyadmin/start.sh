#!/bin/sh

nginx && php-fpm7

# telegraf run in the background
# telegrafコマンドは、成功するまでリトライし続ける。エラーフラグを返さない
telegraf -config /etc/telegraf.conf &

echo "phpmyadmin_nginx start"
tail -f /var/log/nginx/access.log