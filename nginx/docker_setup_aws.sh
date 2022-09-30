#!/bin/bash

### this script installs docker on an Amazon AWS EC2 instance with the Amazon Linux 2 AMI (5.10) OS
sudo su -

yum update -y
yum install -y docker
service docker start

# so you don't have to type sudo before every docker command
usermod -a -G docker ec2-user

# docker autostart
chkconfig docker on
