FROM	alpine:3.13	

# install tools
RUN		set -ex; \
			apk update; \
			apk add nginx openssl wget curl vim openrc; \
			mkdir -p /run/nginx; \
			apk add mysql mysql-client \
			php7-phar php7-fpm php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom \ 
			openrc mandoc man-pages \
			vsftpd libc6-compat influxdb;

#############################
RUN		apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/v3.13/community
#############################

# SSL
RUN		mkdir -p /etc/nginx/ssl
WORKDIR	/etc/nginx/ssl/
RUN		openssl req -newkey rsa:4096 \
                -x509 \
                -sha256 \
                -days 3650 \
                -nodes \
                -out ft_server.crt \
                -keyout ft_server.key \
                -subj "/C=JP/ST=Tokyo/L=Shinjukuku/O=University/OU=IT Department/CN=www.example.com";

# install phpmyadmin
WORKDIR	/tmp
RUN		set -eux; \
			wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz; \
			tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz; \
			rm phpMyAdmin-5.0.2-all-languages.tar.gz; \
			mv phpMyAdmin-5.0.2-all-languages phpmyadmin; \
			mv phpmyadmin/ /var/www/

# install wordpress
RUN		wget https://wordpress.org/latest.tar.gz; \
			tar -xvzf latest.tar.gz; \
			rm latest.tar.gz; \
			mv wordpress /var/www/

# install grafana
RUN		set -ex; \
			wget https://dl.grafana.com/oss/release/grafana-7.4.5.linux-amd64.tar.gz; \
			tar -zxvf grafana-7.4.5.linux-amd64.tar.gz; \
			rm grafana-7.4.5.linux-amd64.tar.gz; \
			mv grafana-7.4.5 grafana; \
			mv grafana/ /;

# wp-cli https://wp-cli.org/ja/
RUN		set -ex; \
			curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
			chmod +x wp-cli.phar; \
			mv wp-cli.phar /usr/local/bin/wp


RUN		chmod -R 755 /tmp /etc
RUN		rm -rf /var/cache/apk/*

WORKDIR	/

#CMD	tail -f /dev/null
