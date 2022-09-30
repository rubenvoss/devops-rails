#!/bin/bash

### this script installs docker on an Amazon AWS EC2 instance with the Debian 11 OS
sudo su -

curl -fsSL https://get.docker.com -o get-docker.sh

sh get-docker.sh

# so you don't have to type sudo before every docker command
usermod -a -G docker admin
