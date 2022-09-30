#!/bin/bash
sudo su -

# download system dependencies
yum update -y
yum groupinstall 'Development Tools' -y
yum install pcre pcre-devel zlib zlib-devel openssl openssl-devel -y

# download nginx && install nginx
wget http://nginx.org/download/nginx-1.22.0.tar.gz
tar -zxvf nginx-1.22.0.tar.gz
cd nginx-1.22.0 || exit
./configure --sbin-path=/usr/bin/nginx --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log \
            --http-log-path=/var/log/nginx/access.log --with-pcre --pid-path=/var/run/nginx.pid \
            --with-http_ssl_module
make
make install

# checks for the nginx version, was it installed?
nginx -V
cd ~ || exit

# download nginx.service file for systemd && copy it into systemd folder
wget https://raw.githubusercontent.com/rubenvoss/devops-rails/main/nginx/nginx.service
cp nginx.service /lib/systemd/system/nginx.service

# start nginx as a systemd service
systemctl start nginx
# check for the status of nginx
systemctl status nginx
# add nginx to startup, if the server restarts -> nginx restarts
systemctl enable nginx
