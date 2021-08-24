FROM	basecamp

COPY	srcs/start.sh /tmp/start.sh
COPY	srcs/mariadb-server.cnf /etc/my.cnf.d
COPY	srcs/telegraf.conf /etc/telegraf.conf

COPY	srcs/livenessprobe.sh /livenessprobe.sh

RUN		chmod -R 755 /tmp

EXPOSE	3306

CMD		/tmp/start.sh
