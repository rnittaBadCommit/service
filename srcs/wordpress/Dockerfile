FROM	basecamp

COPY	srcs/wp-config.php /var/www/wordpress/
COPY	srcs/default.conf /etc/nginx/http.d/
COPY	srcs/www.conf /etc/php7/php-fpm.d/
COPY	srcs/start.sh /tmp/start.sh
COPY	srcs/telegraf.conf /etc/telegraf.conf

COPY	srcs/livenessprobe.sh /livenessprobe.sh

RUN		chmod -R 755 /var /tmp /etc
RUN		chown -R nginx:nginx /etc/nginx

EXPOSE	5050

CMD		/tmp/start.sh
