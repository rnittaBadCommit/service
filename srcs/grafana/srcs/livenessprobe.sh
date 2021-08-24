pgrep grafana-server 
ret=$?
if [ $ret -ne 0 ]; then
	return 1
fi

pgrep telegraf
ret=$?
if [ $ret -ne 0 ]; then
	return 1
fi
