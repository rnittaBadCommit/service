FROM	basecamp

COPY	srcs/start.sh /tmp/start.sh

COPY	srcs/default.conf /etc/nginx/http.d/
COPY	srcs/config.inc.php /var/www/phpmyadmin/

#COPY	srcs/info.php /var/www/phpmyadmin/

COPY	srcs/www.conf /etc/php7/php-fpm.d/

COPY	srcs/telegraf.conf /etc/telegraf.conf

COPY	srcs/livenessprobe.sh /livenessprobe.sh

RUN		chmod -R 755 /var /etc /tmp; \
			chmod -R 777 /tmp /var/log/nginx; \
			chown -R nginx:nginx /etc/nginx;

EXPOSE	5000


CMD		/tmp/start.sh
