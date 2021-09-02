FROM	basecamp

RUN		adduser -D ftp-user && \
 			echo 'ftp-user:ftp-user' | chpasswd

# default dir 
RUN		mkdir -p /var/www/ftp_dir; \
			chown ftp-user /var/www/ftp_dir; \
			chmod 755 /var/www/ftp_dir;

RUN		mkdir -p /etc/vsftpd/user_conf

RUN		touch /var/log/vsftpd.log

COPY	srcs/start.sh /tmp/start.sh
COPY	srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
#COPY	srcs/chroot_list /etc/vsftpd/chroot_list
COPY	srcs/vsftpd.chroot_list /etc/
COPY	srcs/telegraf.conf /etc/telegraf.conf

COPY	srcs/livenessprobe.sh /livenessprobe.sh

RUN		chmod -R 777 /tmp /var /etc

EXPOSE	20 21 60000

CMD		/tmp/start.sh
