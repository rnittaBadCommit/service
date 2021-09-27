#!/bin/sh

sudo apt-get install zsh vim emacs curl gcc clang-9 lldb llvm valgrind php-cli php-curl php-gd php-intl php-json php-mbstring php-xml php-zip php-mysql php-pgsql g++ as31 nasm ruby ruby-bundler ruby-dev build-essential mysql-server sqlite3 postgresql docker.io qemu-kvm virtualbox virtualbox-qt virtualbox-dkms libx11-dev x11proto-core-dev libxt-dev libxext-dev libbsd-dev terminator nasm freeglut3 libncurses5-dev glmark2 cmake nginx docker-compose python3-pip python-pip redis && 
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.0/bin/linux/amd64/kubectl && 
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.0/bin/linux/amd64/kubectl && 
chmod +x ./kubectl && 
sudo mv ./kubectl /usr/local/bin/kubectl && 
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && 
chmod +x minikube && 
sudo mkdir -p /usr/local/bin/ && 
sudo install minikube /usr/local/bin/ && 
sudo usermod -aG docker user42 && 
newgrp docker && 
sudo add-apt-repository ppa:/longsleep/golang-backports && 
sudo apt update && 
sudo apt install golang-go && 
wget -qO- https://deb.nodesource.com/setup_13.x | sudo -E bash - && 
sudo apt install -y nodejs && 
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh


echo 'user42' | sudo -S sysctl fs.protected_regular=0
sudo minikube start --vm-driver=none --extra-config=apiserver.service-node-port-range=1-65535
sudo chown -R $USER:$USER $HOME/.minikube
sudo chmod -R 755 $HOME/.minikube
sudo chown -R $USER:$USER $HOME/.kube
sudo chmod -R 755 $HOME/.kube
sudo chmod -R 777 /var/run/docker.sock

sudo apt install conntrack
sudo dpkg -r --force-depends golang-docker-credential-helpers

kubectl delete -f srcs/metallb/metallb-config.yaml
kubectl delete -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl delete -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl delete -f srcs/nginx/nginx.yaml
kubectl delete -f srcs/phpmyadmin/phpmyadmin.yaml
kubectl delete -f srcs/mysql/mysql.yaml
kubectl delete -f srcs/mysql/mysql-pv.yaml
kubectl delete -f srcs/wordpress/wordpress.yaml
kubectl delete -f srcs/ftps/ftps.yaml
kubectl delete -f srcs/grafana/grafana.yaml
kubectl delete -f srcs/influxdb/influxdb.yaml

echo -e "\n\ndelete done\n"

echo 'user42' | sudo -S apt-get install lftp

if [ ! -d "/data/ftp-user" ]; then
	sudo mkdir -p /data/ftp-user
	sudo chmod 777 /data/ftp-user
	echo "[run.sh] /data/ftp-user made."
else
	echo "[run.sh] /data/ftp-user already exist."
fi

# images
docker build -t basecamp srcs/basecamp/
docker build -t mynginx srcs/nginx/
docker build -t mypma srcs/phpmyadmin/
docker build -t mymysql srcs/mysql/
docker build -t mywordpress srcs/wordpress/
docker build -t myftps srcs/ftps/
docker build -t mygrafana srcs/grafana/
docker build -t myinfluxdb srcs/influxdb/
# metallb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/metallb/metallb-config.yaml

# containers
kubectl apply -f srcs/nginx/nginx.yaml

kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml

kubectl apply -f srcs/mysql/mysql-pv.yaml
kubectl apply -f srcs/mysql/mysql.yaml

kubectl apply -f srcs/wordpress/wordpress.yaml




kubectl apply -f srcs/ftps/ftps.yaml
kubectl apply -f srcs/ftps/ftps-pv.yaml

kubectl apply -f srcs/grafana/grafana.yaml

kubectl apply -f srcs/influxdb/influxdb.yaml
kubectl apply -f srcs/influxdb/influxdb-pv.yaml

echo done!

