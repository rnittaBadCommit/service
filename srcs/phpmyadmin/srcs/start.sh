#!/bin/sh

nginx && php-fpm7
echo "phpmyadmin start"
telegraf -config /etc/telegraf.conf &
tail -f /var/log/nginx/access.log
