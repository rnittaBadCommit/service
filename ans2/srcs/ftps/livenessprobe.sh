# ➜  work git:(master) ✗ kubectl exec deploy/nginx -- pkill nginx
# ➜  work git:(master) ✗ kubectl exec deploy/nginx -- pgrep nginx
# command terminated with exit code 1

pgrep vsftpd
health=$?
if [ $health -ne 0 ]; then
	return 1
fi

pgrep telegraf
health=$?
if [ $health -ne 0 ]; then
	return 1
fi
