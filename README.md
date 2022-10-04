# CI & CD for your Rails App(s)
## [**Watch a short video about CI & CD**](https://www.youtube.com/watch?v=scEDHsr3APg)
## What are the benefits of CI & CD for my Railsapps?
- Your Webapps will be updated automatically, after you merge to master - no more heroku push!
- Getting your own Virtual Private Server is cheaper than having a managed host like Heroku
- When you add automatic testing to your Webapp, less bugs will slip through to your Users
- You can test and deploy in small & manageable steps
- Bonus: You're only gonna have to buy one domain, and will be able to host all your Projects on it with subdomains!
<br />

## What's in this guide?
- Automatically test your App on a Github Server - Add a CI Pipeline to your Rails App with Github Actions
- Configured your own VPS (Virtual Private Server)
  - Setup Nginx, Docker
  - Configured a reverse Proxy to host multiple Subdomains on one Website
- Continuously Deploy your Rails App
<br />

# Buy a VPS and Domain
I used AWS here, they're free for the first 12 months. You can use any VPS that runs Debian 11 (probably also other versions & Ubuntu, if you choose a different package manager you will have to change some code with installing system dependencies)
https://aws.amazon.com/
https://www.netcup.de/vserver/vps.php
<br />
<br />
