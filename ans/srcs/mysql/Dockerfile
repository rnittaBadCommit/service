FROM basecamp

#RUN mkdir -p /app/mysql &&\
#	chmod -R 777 /app

# These lines moved to the end allow us to rebuild image quickly after only these files were modified.
COPY start.sh /tmp/start.sh
COPY mariadb-server.cnf /etc/my.cnf.d
COPY telegraf.conf /etc/telegraf.conf
COPY livenessprobe.sh /livenessprobe.sh

RUN chmod -R 755 /tmp
EXPOSE 3306
CMD ["/tmp/start.sh"]