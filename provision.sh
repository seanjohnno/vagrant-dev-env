#!/bin/bash

sudo yum update -y

# Install Nginx
sudo yum install epel-release -y
sudo yum install nginx -y
sudo cp /vagrant/nginx.conf /etc/nginx/nginx.conf
sudo systemctl start nginx
sudo systemctl enable nginx

# This seems necessary to allow nginx to upstream to host
sudo setsebool -P httpd_can_network_connect 1

# Install MariaDB
sudo yum install mariadb-server -y
sudo systemctl start mariadb
sudo systemctl enable mariadb
sudo mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'192.168.50.%' IDENTIFIED BY 'mypassword' WITH GRANT OPTION;"