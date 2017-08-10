#!/bin/bash

function allEnvironments {
	updatePackages
	installNGINX
	installMariaDB
	addDatabase
}

function updatePackages {
	sudo yum update -y
}

function installNGINX {
	sudo yum install -y epel-release
	sudo yum install -y nginx
	sudo systemctl start nginx
	sudo systemctl enable nginx
}

function installMariaDB {
	sudo yum install -y mariadb-server mariadb
	sudo systemctl start mariadb
	sudo systemctl enable mariadb
}

function addDBUser {
	cat /vagrant/createDBUser.sql | mysql
}

function addDatabase {
	echo "TODO - Add database"
}

function setupNGINXServerBlock {
	sudo cp -f /vagrant/nginx.conf /etc/nginx/nginx.conf
	sudo cp -rf /vagrant/www/. /usr/share/nginx/html/
	sudo setsebool httpd_can_network_connect on -P
	sudo systemctl restart nginx
}

updatePackages
installNGINX
installMariaDB
addDBUser
addDatabase
setupNGINXServerBlock
