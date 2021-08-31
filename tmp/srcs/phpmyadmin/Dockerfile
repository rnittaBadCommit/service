# origin
# https://wiki.alpinelinux.org/wiki/PhpMyAdmin

FROM basecamp

COPY start.sh /tmp/start.sh

# doc root
COPY default.conf /etc/nginx/conf.d/default.conf
COPY config.inc.php /var/www/phpmyadmin

# php config (ps aux)
# 12 nobody    0:00 {php-fpm7} php-fpm: pool www
# -> nginx     0:00 {php-fpm7} php-fpm: pool www
COPY www.conf /etc/php7/php-fpm.d
COPY telegraf.conf /etc/telegraf.conf
COPY livenessprobe.sh /livenessprobe.sh

# etcはサーバー系が全部入ってるから755微妙
RUN	chmod -R 755 /var /etc /tmp

# tmpは書き込み権限が必要。phpmyadminにアクセスしたときに、tmpに書き込みがなされるため
# 権限がないとpermission denied発生
# w権限がないと、access.logも書き込めないかも
RUN	chmod -R 777 /tmp /var/log/nginx
# socketでfastCGIを受け付ける場合、/var/run/php7-fpm.sockを777に。
RUN chown -R nginx:nginx /etc/nginx

# port
EXPOSE 5000

CMD [ "/tmp/start.sh" ]
