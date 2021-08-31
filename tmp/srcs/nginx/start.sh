#!/bin/sh

nginx
echo "mynginx start"
# telegraf run in the background
telegraf -config /etc/telegraf.conf &

tail -f /var/log/nginx/access.log
