# https://qiita.com/rspepe/items/c0c0119032ccc79ff7a1

FROM basecamp

# doc root
RUN mkdir -p app

COPY app /app
COPY default.conf /etc/nginx/conf.d/default.conf
COPY start.sh /tmp/start.sh
COPY telegraf.conf /etc/telegraf.conf
COPY livenessprobe.sh /livenessprobe.sh

RUN	chmod -R 755 /app /tmp /etc
#access logへの書き込み権限を与えないと、環境変数が出力されない
RUN chown -R nginx:nginx /etc/nginx

# port
EXPOSE 80 443 22

CMD [ "/tmp/start.sh" ]
