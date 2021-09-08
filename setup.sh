# Reseting
minikube delete
minikube start

# Install MetalLB
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.4/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.4/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

# apply loadbalancer
kubectl apply -f srcs/conf/metal.yaml

eval $(minikube docker-env)

# Creating The Docker Images
docker build -t nginx       srcs/nginx/
docker build -t wordpress   srcs/Wordpress/
docker build -t phpmyadmin  srcs/phpMyAdmin/
docker build -t mysql       srcs/MySQL/
docker build -t influxdb    srcs/InfluxDB/
docker build -t grafana     srcs/Grafana/
docker build -t ftps        srcs/FTPS/

# Creating The Volumes
kubectl apply -f            srcs/MySQL/mysql-volume.yaml
kubectl apply -f            srcs/InfluxDB/influxdb-volume.yaml

# Creating The Pods
kubectl apply -f            srcs/nginx/nginx-deploy.yaml
kubectl apply -f            srcs/Wordpress/wordpress-deploy.yaml
kubectl apply -f            srcs/phpMyAdmin/phpmyadmin-deploy.yaml
kubectl apply -f            srcs/MySQL/mysql-deploy.yaml
kubectl apply -f            srcs/InfluxDB/influxdb-deploy.yaml
kubectl apply -f            srcs/Grafana/grafana-deploy.yaml
kubectl apply -f            srcs/FTPS/ftps-deploy.yaml

# Creating The Services
kubectl apply -f            srcs/nginx/nginx-service.yaml
kubectl apply -f            srcs/Wordpress/wordpress-service.yaml
kubectl apply -f            srcs/phpMyAdmin/phpmyadmin-service.yaml
kubectl apply -f            srcs/MySQL/mysql-service.yaml
kubectl apply -f            srcs/InfluxDB/influxdb-service.yaml
kubectl apply -f            srcs/Grafana/grafana-service.yaml
kubectl apply -f            srcs/FTPS/ftps-service.yaml

# Running Minikube Dashboard
clear
minikube dashboard
