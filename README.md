# CI & CD for your Rails App(s)
## [**Watch a short video about CI & CD**](https://www.youtube.com/watch?v=scEDHsr3APg)

## What's in this guide?
- Automatically test your App on a Github Server - Add a CI Pipeline to your Rails App with Github Actions
- Configured your own VPS (Virtual Private Server)
  - Setup Nginx, Docker
  - Configured a reverse Proxy to host multiple Subdomains on one Website
- Continuously Deploy your Rails App
<br />

## Buy a VPS and Domain
I used AWS here, they're free for the first 12 months. You can use any VPS that runs Debian 11 (probably also other versions & Ubuntu, if you choose a different package manager you will have to change some code with installing system dependencies)
<br>

https://aws.amazon.com/
<br>

https://www.netcup.de/vserver/vps.php
<br />
<br />

## Prerequisites
[Docker for your App](https://github.com/rubenvoss/docker-rails)

## [1. Setup your server](setup_server.md)
## [2. Secure your server](secure_server.md)
## [3. CI Pipeline](rails_continuous_integration.md)
## [3. CD Pipeline](rails_continuous_deployment.md)
