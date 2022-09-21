FROM nginx:alpine

# RUN rm /etc/nginx/nginx.conf

COPY ./nginx.conf /etc/nginx/nginx.conf

COPY ./index.html /usr/share/nginx/html

# RUN mkdir /data/www

# COPY ../src/index.html /data/www

EXPOSE 80
