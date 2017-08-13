# Vagrant-Dev-Env

Vagrant environment running CentOS 7, NGINX and MariaDB. Allows you to use a production-like environment but develop/debug in your host machines IDE. NGINX serves static files but also reverse proxies to port 5678 on your host machine. MariaDB is accessible on port 3306.

## Getting started

Provisioning the environment:

```bash
cd development

# You only need to run this once
./vagrantup.sh

# To pause/resume
vagrant suspend
vagrant resume
```

Put your static files in the /www folder and to have NGINX pick them up:

```bash
curl http://localhost:4567/syncfiles
```

...I've set IntelliJ (my IDE of choice) to automatically perform this step on each build.

MariaDB can be accessed on port 3306 with *password123*
