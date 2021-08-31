FROM basecamp

COPY start.sh /tmp/start.sh
COPY custom.ini /grafana/custom.ini
COPY telegraf.conf /etc/telegraf.conf
# /grafanaをTOPに配置
COPY dashboards /grafana/conf/provisioning/dashboards
COPY datasources /grafana/conf/provisioning/datasources
COPY livenessprobe.sh /livenessprobe.sh

RUN chmod -R 755 /grafana/conf /tmp
EXPOSE 3000
CMD ["/tmp/start.sh"]
