#https://grafana.com/docs/grafana/latest/administration/provisioning/#dashboards

FROM	basecamp

COPY	srcs/start.sh /tmp/start.sh
COPY	srcs/mydefault.ini /grafana/mydefault.ini
COPY	srcs/telegraf.conf /etc/telegraf.conf
COPY	srcs/dashboards.json /grafana/dashboards/
COPY	srcs/dashboards.yaml /grafana/conf/provisioning/dashboards/
COPY	srcs/datasources.yaml /grafana/conf/provisioning/datasources/

COPY	srcs/livenessprobe.sh /livenessprobe.sh

RUN		chmod -R 755 /tmp /grafana/conf

EXPOSE	3000
CMD		/tmp/start.sh
