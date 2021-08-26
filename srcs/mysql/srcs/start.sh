#!/bin/sh

# origin
# https://github.com/wangxian/alpine-mysql/blob/master/Dockerfile
# bash commands
# https://qiita.com/wakayama-y/items/a9b7380263da77e51711

# -d = is directory?
if [ ! -d "/run/mysqld" ]; then
 mkdir -p /run/mysqld
fi

# /app/mysqlはもともと存在しない。mysql_install_db --datadir=/app/mysqlによって作成される。
# mountpath = /app/mysql とすると、空フォルダが作られてしまう。
if [ -d "/app/mysql" ]; then
 echo "[i] MySQL directory already present, skipping creation"
else
 echo "[i] MySQL data directory not found, creating initial DBs"
 
 mysql_install_db --user=root > /dev/null

 if [ "$MYSQL_ROOT_PASSWORD" = "" ]; then
   MYSQL_ROOT_PASSWORD=root
   echo "[i] MySQL root Password: $MYSQL_ROOT_PASSWORD"
 fi
# ${ENV:-"word"} === (ENV?)ENV:word
 MYSQL_DATABASE=${MYSQL_DATABASE:-"services"}
 MYSQL_USER=${MYSQL_USER:-"rnitta"}
 MYSQL_PASSWORD=${MYSQL_PASSWORD:-"pass"}

 # mktemp make a random name file
 # /tmp/tmp.LCOCdE
 tfile=`mktemp`
 # -f = is normal file?
 if [ ! -f "$tfile" ]; then
     return 1
 fi

 cat << EOF > $tfile
USE mysql;
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY "$MYSQL_ROOT_PASSWORD" WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
ALTER USER 'root'@'localhost' IDENTIFIED BY '';
EOF

 if [ "$MYSQL_DATABASE" != "" ]; then
   echo "[i] Creating database: $MYSQL_DATABASE"
   # COLLATE = set sort database rule
   echo "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\` CHARACTER SET utf8 COLLATE utf8_general_ci;" >> $tfile

   if [ "$MYSQL_USER" != "" ]; then
     echo "[i] Creating user: $MYSQL_USER with password $MYSQL_PASSWORD"
     # %:wildcatd host
     echo "GRANT ALL ON \`$MYSQL_DATABASE\`.* to '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> $tfile
   fi
 fi

# verbose=0: logを出さない
 /usr/bin/mysqld --user=root --bootstrap --verbose=0 < $tfile
 rm -f $tfile
fi
# console: (Windows のみ。)このオプションが使用されている場合、エラーログメッセージを stderr に書き込み、stdout. mysqld はコンソールウィンドウを閉じません。
# exec 外部プロセスで実行。 pkillしても残ってしまう
telegraf -config /etc/telegraf.conf &  # maybe it shouldnt be the last

/usr/bin/mysqld --user=root

