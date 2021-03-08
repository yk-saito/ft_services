#!/bin/sh

# Environment variable
METALLB_VER='v0.9.5'

# Color
GREEN='\e[0;32m'

minikube delete

minikube start

#
eval $(minikube docker-env)

# 
echo Docker build images
docker build -t nginx:ysaito srcs/nginx
#docker build -t mysql:ysaito srcs/mysql
docker build -t phpmyadmin:ysiato srcs/phpmyadmin
docker build -t wordpress:ysaito srcs/wordpress
docker build -t ftps:ysaito srcs/ftps
#docker build -t influxdb:ysaito srcs/influxdb
#docker build -t grafana:ysaito srcs/grafana
echo "${GREEN}Successfully created docker images. "

# Apply yaml files
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/${METALLB_VER}/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/${METALLB_VER}/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/metallb.yaml
kubectl apply -f srcs/nginx/nginx.yaml
#kubectl apply -f srcs/mysql/mysql.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f srcs/wordpress/wordpress.yaml
kubectl apply -f srcs/ftps/ftps.yaml
#kubectl apply -f srcs/influxdb/influxdb.yaml
#kubectl apply -f srcs/grafana/grafana.yaml

echo "${GREEN}Successfully execute kubectl. "

minikube service nginx-svc
minikube service wordpress-svc
minikube service phpmyadmin-svc

# Open Kubernetes Dashboard
minikube dashboard