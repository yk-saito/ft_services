#!/bin/bash

# Environment variable
METALLB_VER='v0.9.6'

# Color
GREEN=$'\e[0;32m'
COLOR_RESET=$'\e[0m'

# mysql using port 
sudo netstat -nlpt | grep 3306
sudo service mysql stop

minikube delete
<<<<<<< HEAD
#rm ~/.kube ~/.minikube
#minikube start --vm-driver none
minikube start
=======
rm ~/.kube ~/.minikube
minikube start --vm-driver none

>>>>>>> 3cf370bf2c83369bd5904e1ddef59ac96fea7b48
#
eval $(minikube docker-env)

#
echo Docker build images
docker build -t nginx:ysaito ./srcs/nginx
docker build -t mysql:ysaito ./srcs/mysql
docker build -t phpmyadmin:ysaito ./srcs/phpmyadmin
docker build -t wordpress:ysaito ./srcs/wordpress
docker build -t ftps:ysaito ./srcs/ftps
docker build -t influxdb:ysaito srcs/influxdb
docker build -t grafana:ysaito srcs/grafana
echo "${GREEN}Successfully created docker images.${COLOR_RESET}"

# Install metalLB
#kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
#kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
#kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/${METALLB_VER}/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/${METALLB_VER}/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl apply -f ./srcs/yamls/metallb-system.yaml
kubectl apply -f ./srcs/yamls/nginx.yaml
kubectl apply -f ./srcs/yamls/mysql.yaml
kubectl apply -f ./srcs/yamls/phpmyadmin.yaml
kubectl apply -f ./srcs/yamls/wordpress.yaml
kubectl apply -f ./srcs/yamls/ftps.yaml
kubectl apply -f ./srcs/yamls/influxdb.yaml
kubectl apply -f ./srcs/yamls/grafana.yaml

echo "${GREEN}Successfully execute kubectl.${COLOR_RESET}"

# Open Kubernetes Dashboard
minikube dashboard
