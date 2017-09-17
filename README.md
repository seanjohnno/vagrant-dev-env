# Vagrant-Dev-Env

Vagrant box running CentOS 7, NGINX and MariaDb. It's intended to mimic a production environment while allowing you to develop on your local machine. 

* NGINX can be accessed on http://localhost:4567. Serving static files from /usr/share/nginx/html (file sync coming soon). If no matching file is found...
* NGINX reverse proxies to port 5678 on your host machine. Allowing it to connect to your web framework of choice
* MariaDb is accessible through port 3306 (user: root, pass: mypassword)

## Getting started

Creating the environment:

```bash
vagrant up

# To pause/resume
vagrant suspend
vagrant resume

# To destroy
vagrant destroy
```

To pause/resume:

```bash
vagrant suspend
vagrant resume
```

To destroy:

```bash
vagrant destroy
```

## Prerequisites

* Virtualbox
* Vagrant