#!/bin/bash
sudo su -

# cd /home/ec2-user
yum update -y
yum groupinstall 'Development Tools' -y
yum install pcre pcre-devel zlib zlib-devel openssl openssl-devel -y

##

curl http://nginx.org/download/nginx-1.22.0.tar.gz --output nginx-1.22.0.tar.gz
tar -zxvf nginx-1.22.0.tar.gz
cd nginx-1.22.0
./configure --sbin-path=/usr/bin/nginx --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log \
            --http-log-path=/var/log/nginx/access.log --with-pcre --pid-path=/var/run/nginx.pid \
            --with-http_ssl_module
make
make install

# checks for the nginx version, was it installed?
nginx -V
