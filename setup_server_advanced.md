# Adding multiple webapps to your server with nginx
```
events {}

http {

  server {

    listen 80;
    server_name rubenvoss.com;

    location / {

      # passing the goclimb homepage rubenoss.com/
      proxy_pass 'http://www.goclimb.fun/';
    }

    location /php {

      # this is the php server running on localhost port 9999, passing to rubenoss.com/php
      proxy_pass 'http://localhost:9999/';
    }

    location /nginxorg {

      # passing the nginx org page to rubenoss.com/nginxorg
      proxy_pass 'http://nginx.org/';
    }
  }
}
```
