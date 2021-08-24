#!/bin/sh

# / # wp user create
# Error: This does not seem to be a WordPress installation.
# Pass --path=`path/to/wordpress` or run `wp core download`.

# wordpressのpathを要求される
cd /var/www/wordpress/

# /var/www/wordpress # wp user create
# Error: The site you have requested is not installed.
# Run `wp core install` to create database tables.

# database tablesがないのでwp core installを実施
wp core install --allow-root \
	--url=https://192.168.10.10:5050 \
	--title=wordpress \
	--admin_user=rnitta \
	--admin_password=pass \
	--admin_email=rnitta@student.42tokyo.jp

db_creation=$?
echo "db_creation:$db_creation"
if [ $db_creation -ne 0 ]; then
	echo "[i] MySQL did not start. Finish"
	return 1;
else
	echo "[i] MySQL started."
fi

# --role 購読者 subscriber / 寄稿者 contributor / 投稿者 author / 編集者 editor / 管理者 administrator
# https://analyzegear.co.jp/blog/356#toc2
wp user create --allow-root \
	user01 \
	user01@42tokyo.jp \
	--role=subscriber \
	--user_pass=user01

wp user create --allow-root \
	user02 \
	user02@42tokyo.jp \
	--role=contributor \
	--user_pass=user02

wp user create --allow-root \
	user03 \
	user03@42tokyo.jp \
	--role=author \
	--user_pass=user03

wp user create --allow-root \
	user04 \
	user04@42tokyo.jp \
	--role=editor \
	--user_pass=user04

nginx && php-fpm7
echo "wordpress start"
telegraf -config /etc/telegraf.conf &
tail -f /var/log/nginx/access.log
