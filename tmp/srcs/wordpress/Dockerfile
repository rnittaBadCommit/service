FROM basecamp

# copy wp-config.php
COPY wp-config.php /var/www/wordpress/
COPY default.conf /etc/nginx/conf.d/default.conf
COPY www.conf /etc/php7/php-fpm.d
COPY start.sh /tmp/start.sh
COPY telegraf.conf /etc/telegraf.conf
COPY livenessprobe.sh /livenessprobe.sh

#  Permission denied in /var/www/wordpress/wp-load.php 
RUN	chmod -R 755 /var /tmp /etc
#access logへの書き込み権限を与えないと、環境変数が出力されないかも
RUN chown -R nginx:nginx /etc/nginx

# port
EXPOSE 5050

WORKDIR /

CMD [ "/tmp/start.sh" ]
