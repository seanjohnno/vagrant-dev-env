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
	sudo setsebool httpd_can_network_connect on -P
	sudo systemctl restart nginx
}

function installVirtualBoxGuestAdditions {
	sudo yum groupinstall "Development Tools" -y
    sudo yum install kernel-devel -y
    sudo yum install epel-release -y
    sudo yum install dkms -y
    sudo yum install wget -y 
    
    wget -O /tmp/Fedora-18-i386-DVD.iso "http://download.virtualbox.org/virtualbox/5.1.26/VBoxGuestAdditions_5.1.26.iso"
    sudo mkdir /mnt/VBoxLinuxAdditions
    sudo mount -t iso9660 -o loop /tmp/Fedora-18-i386-DVD.iso /mnt/VBoxLinuxAdditions
    sudo sh /mnt/VBoxLinuxAdditions/VBoxLinuxAdditions.run
    
    umount /mnt/VBoxLinuxAdditions
    rm /tmp/Fedora-18-i386-DVD.iso
}

function runFileSyncAsService {
	sudo cp /vagrant/syncservice /etc/systemd/system/sync.service
	sudo systemctl daemon-reload
	sudo systemctl start sync
	sudo systemctl enable sync
}

updatePackages
installNGINX
installMariaDB
addDBUser
addDatabase
setupNGINXServerBlock
installVirtualBoxGuestAdditions
runFileSyncAsService
