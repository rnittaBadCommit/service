FROM	basecamp

COPY	srcs/start.sh /tmp/start.sh
COPY	srcs/influxdb.conf /etc/influxdb.conf
COPY	srcs/telegraf.conf /etc/telegraf.conf

RUN		mkdir -p /etc/ssl
RUN		cp /etc/nginx/ssl/ft_server.crt /etc/ssl/ft_server.crt
RUN		cp /etc/nginx/ssl/ft_server.key /etc/ssl/ft_server.key
RUN		chmod -R 777 /etc/ssl /tmp

COPY	srcs/livenessprobe.sh /livenessprobe.sh

EXPOSE	8086

CMD		/tmp/start.sh
