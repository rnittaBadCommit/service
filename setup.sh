#!/bin/sh

echo 'user42' | sudo -S sysctl fs.protected_regular=0
sudo minikube start --vm-driver=none --extra-config=apiserver.service-node-port-range=1-65535
sudo chown -R $USER:$USER $HOME/.minikube
sudo chmod -R 755 $HOME/.minikube
sudo chown -R $USER:$USER $HOME/.kube
sudo chmod -R 755 $HOME/.kube
sudo chmod -R 777 /var/run/docker.sock

sudo apt install conntrack
sudo dpkg -r --force-depends golang-docker-credential-helpers

