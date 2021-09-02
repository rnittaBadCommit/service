FROM	basecamp 


RUN		mkdir -p app
COPY 	./app/ /app/
COPY	./srcs/default.conf /etc/nginx/http.d/
COPY	./srcs/start.sh /tmp/start.sh
COPY	srcs/telegraf.conf /etc/telegraf.conf

COPY	srcs/livenessprobe.sh /livenessprobe.sh

RUN		chmod -R 755 /app /tmp /etc
RUN		chown -R nginx:nginx /etc/nginx

EXPOSE	80 443 22

CMD		/tmp/start.sh ;
