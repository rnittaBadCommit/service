#!/bin/sh

# telegraf run in the background
telegraf -config /etc/telegraf.conf &

/usr/sbin/influxd -config /etc/influxdb.conf