#!/bin/sh

sudo sysctl fs.protected_regular=0
sudo minikube start --vm-driver=none --extra-config=apiserver.service-node-port-range=1-65535
sudo chown -R $USER:$USER $HOME/.minikube
sudo chmod -R 755 $HOME/.minikube
sudo chown -R $USER:$USER $HOME/.kube
sudo chmod -R 755 $HOME/.kube
sudo chmod -R 777 /var/run/docker.sock
