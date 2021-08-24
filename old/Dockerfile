FROM 	debian:buster

# install tools
RUN	apt update && apt upgrade; \
	apt install -y \
		nginx \
		mariadb-server mariadb-client \
		php-cgi php-common php-fpm php-pear php-mbstring php-zip php-net-socket php-gd php-xml-util php-gettext php-mysql php-bcmath \
		unzip \
		wget

COPY	./srcs/php.ini /etc/php/7.3/fpm/php.ini

# SSL
RUN		mkdir ssl
RUN     apt install openssl; \
        openssl req -newkey rsa:4096 \
                -x509 \
                -sha256 \
                -days 3650 \
                -nodes \
                -out ssl/ft_server.crt \
                -keyout ssl/ft_server.key \
                -subj "/C=JP/ST=Tokyo/L=Shinjukuku/O=University/OU=IT Department/CN=www.example.com";

# create db
RUN	service php7.3-fpm start; \
		service mysql start && mysql -u root; \
		mysql -e "CREATE DATABASE wpdb;"; \
		mysql -e "GRANT ALL ON wpdb. * TO 'wordpress'@'localhost' IDENTIFIED BY 'wordpress' WITH GRANT OPTION;";

# install phpmyadmin
RUN	set -eux; \
		wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz; \
		tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz; \
		rm phpMyAdmin-5.0.2-all-languages.tar.gz; \
		mv phpMyAdmin-5.0.2-all-languages phpmyadmin; \
		mv phpmyadmin/ /var/www/html/

# install wordpress
RUN	wget https://wordpress.org/latest.tar.gz; \
		tar -xvzf latest.tar.gz; \
		rm latest.tar.gz; \
		mv wordpress /var/www/html/

COPY	./srcs/wp-config.php ./var/www/html/wordpress/
COPY	./srcs/wordpress.conf /etc/nginx/sites-available/
COPY 	./srcs/util.sh /tmp/
RUN     sed -i 's/\r//' tmp/util.sh;
RUN		chmod 755 /tmp/util.sh; \
			chown -R www-data:www-data /var/www/html/wordpress; \
			ln -s /etc/nginx/sites-available/wordpress.conf /etc/nginx/sites-enabled/;

RUN		rm -f /etc/nginx/sites-enabled/default;

EXPOSE  80 443

CMD		bash /tmp/util.sh; \
		service php7.3-fpm stop && service php7.3-fpm start; \
		service nginx start; \
		service mysql start; \
		tail -f /dev/null
