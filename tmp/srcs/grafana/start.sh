#!/bin/sh

# telegraf run in the background
telegraf -config /etc/telegraf.conf &

/grafana/bin/grafana-server -homepath /grafana --config /grafana/custom.ini