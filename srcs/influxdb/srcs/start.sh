#!/bin/sh

telegraf -config /etc/telegraf.conf &

/usr/sbin/influxd -config /etc/influxdb.conf
