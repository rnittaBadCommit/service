#!/bin/sh

# telegraf run in the background
telegraf -config /etc/telegraf.conf &

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf