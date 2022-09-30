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


# download devops-rails repo, to have the nginx.service and nginx.conf files available
cd ~ || exit
wget https://github.com/rubenvoss/devops-rails/archive/refs/heads/main.zip
unzip main.zip # unzips into devops-rails-main folder

# copy nginx.service file to add nginx to systemd
rm -f /lib/systemd/system/nginx.service
cp ~/devops-rails-main/nginx/nginx.service /lib/systemd/system/nginx.service

# copy nginx.conf to setup configuration
rm -f /etc/nginx/nginx.conf
cp ~/devops-rails-main/nginx/nginx.conf /etc/nginx/nginx.conf

# add nginx to startup, if the server restarts -> nginx restarts
systemctl enable nginx

# reboot server
reboot
# check for the status of nginx
systemctl status nginx
# checks for the nginx version, was it installed?
nginx -V

# remove leftover files
