# https://qiita.com/rspepe/items/c0c0119032ccc79ff7a1

FROM alpine:3.13

RUN set -ex; \
	apk update; \
	apk add nginx openssl wget curl; \
	mkdir -p /run/nginx; \
	# php-mysql (no such package):
	apk add mysql mysql-client; \
	apk add php7-phar php7-fpm php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom; \
	# openrc: rc-service   mandoc+man-pages: man
	apk add openrc mandoc man-pages; \
	apk add vsftpd; \
	# grafana-server
	apk add libc6-compat; \
	apk add influxdb; \
	apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/v3.13/community

# SSL[.crt]を作る
# https://linuxize.com/post/creating-a-self-signed-ssl-certificate/
# .key:秘密鍵
# cirtificate signing request = 証明書署名要求 「証明書を発行してもらうために必要なもの」
# "/C=CountryName/ST=StateName/L=CityName/O=OrganizaitonName/OU=OrganizationalUnit/CN=DomainName"

RUN mkdir /etc/nginx/ssl
WORKDIR /etc/nginx/ssl/
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 3650 -nodes -out ft_service.crt -keyout ft_service.key \
	-subj "/C=JP/ST=Tokyo/L=hoge/O=fuga/OU=foo/CN=localhost"

# wordpress install
WORKDIR /tmp
RUN set -ex; \
	wget https://wordpress.org/latest.tar.gz; \
	tar -xvzf latest.tar.gz; \
	rm latest.tar.gz; \
	mv wordpress/ /var/www/

# phpmyadmin install
RUN set -ex; \
	wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz; \
	tar -xvzf phpMyAdmin-5.0.2-all-languages.tar.gz; \
	rm phpMyAdmin-5.0.2-all-languages.tar.gz; \
	mv phpMyAdmin-5.0.2-all-languages phpmyadmin; \
	mv phpmyadmin/ /var/www

# wp-cli https://wp-cli.org/ja/
RUN set -ex; \
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
	chmod +x wp-cli.phar; \
	mv wp-cli.phar /usr/local/bin/wp

# grafana
# ref: https://zenn.dev/tkomatsu/scraps/42e6cd3f96f4e5
RUN set -ex; \
	wget https://dl.grafana.com/oss/release/grafana-7.4.5.linux-amd64.tar.gz; \
	tar -zxvf grafana-7.4.5.linux-amd64.tar.gz; \
	rm grafana-7.4.5.linux-amd64.tar.gz; \
	mv grafana-7.4.5 grafana; \
	mv grafana/ /

RUN	chmod -R 755 /tmp /etc

# cache clear
RUN rm -rf /var/cache/apk/*

WORKDIR /