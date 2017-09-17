Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  
  config.vm.synced_folder ".", "/vagrant", type: "rsync"
  
  # Allow access to MariaDB
  config.vm.network "forwarded_port", guest: 3306, host: 3306
  
  # Allow access to NGINX
  config.vm.network "forwarded_port", guest: 80, host: 4567
  
  # Static IP so nginx can call out to host on "192.168.50.1"
  config.vm.network "private_network", ip: "192.168.50.100"
  
  config.vm.provision "shell", path: "./provision.sh"
end