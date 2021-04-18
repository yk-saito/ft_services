#!/bin/bash

# Environment variable
METALLB_VER='v0.9.6'

# Check mysql using port 3306
sudo netstat -nlpt | grep 3306
if [ $? = 0 ]; then
  sudo service mysql stop
fi

# error Failed to save config: open /home/user42/.minikube/profiles/minikube/config.json: permission denied
sudo chmod -R 777 ~/.minikube
sudo chmod -R 777 ~/.kube

minikube stop
minikube delete
minikube start --driver=docker

#sudo chmod -R 777 ~/.minikube
#sudo chmod -R 777 ~/.kube

eval $(minikube docker-env)

docker build -t nginx:ysaito ./srcs/nginx
docker build -t mysql:ysaito ./srcs/mysql
docker build -t phpmyadmin:ysaito ./srcs/phpmyadmin
docker build -t wordpress:ysaito ./srcs/wordpress
docker build -t ftps:ysaito ./srcs/ftps
docker build -t influxdb:ysaito ./srcs/influxdb
docker build -t grafana:ysaito ./srcs/grafana

# Create secret
kubectl create secret generic influxdb-creds \
  --from-literal=INFLUXDB_DATABASE=telegraf \
  --from-literal=INFLUXDB_USERNAME=admin42 \
  --from-literal=INFLUXDB_PASSWORD=admin42 \
  --from-literal=INFLUXDB_HOST=influxdb-svc
kubectl create secret generic grafana-creds \
  --from-literal=GF_SECURITY_ADMIN_USER=admin42 \
  --from-literal=GF_SECURITY_ADMIN_PASSWORD=admin42

# MetalLB apply
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/${METALLB_VER}/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/${METALLB_VER}/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl apply -f ./srcs/yamls/metallb-config.yaml
kubectl apply -f ./srcs/yamls/nginx.yaml
kubectl apply -f ./srcs/yamls/mysql.yaml
kubectl apply -f ./srcs/yamls/phpmyadmin.yaml
kubectl apply -f ./srcs/yamls/wordpress.yaml
kubectl apply -f ./srcs/yamls/ftps.yaml
kubectl apply -f ./srcs/yamls/influxdb.yaml
kubectl apply -f ./srcs/yamls/grafana.yaml

# Open Kubernetes Dashboard
minikube dashboard
