#!/bin/bash

cp VagrantfilePre Vagrantfile
vagrant up
cp VagrantfilePost Vagrantfile
vagrant reload
