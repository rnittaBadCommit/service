#!/bin/sh

telegraf -config /etc/telegraf.conf &

/grafana/bin/grafana-server -homepath /grafana --config /grafana/mydefault.ini
