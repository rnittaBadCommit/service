#!/bin/sh

nginx
echo "mynginx start"
telegraf -config /etc/telegraf.conf &
tail -f /var/log/nginx/access.log
