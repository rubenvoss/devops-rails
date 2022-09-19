# DevOpsify your (Rails) App(s)
## What are the benefits of DevOpsifying my Webapp(s)?  
- Your Webapps will be updated automatically, after you merge to master - no more heroku push!
- Getting your own Virtual Private Server is cheaper than having a managed host like Heroku, AWS, GCP
- When you add tests to your Webapp, less bugs will slip through to your Users
- You're only gonna have to buy one domain, and will be able to host all your Projects on it with subdomains!
- You're gonna learn some Docker, which is gonna make your life as a Developer easier!
<br />

## After Reading this Guide, you can:
- Host multiple Webapps on one Website, like so:
  - project1.website.com
  - project2.website.com
  - experiment.website.com
- Setup your own VPS
  - Configure SSH keypairs on your VPS
  - Setup Caddyserver, Watchtower, Docker
  - Keep all important packages up to date
  - 
- Add a CI/CD Pipeline to your Rails App with github Actions
- Integrate testing into your Rails App
- Deploy your Rails App with Docker containers
<br />

# Buy a VPS and Domain
I used netcup for both of this (to have all of my information in one spot), but you can use any domain/hosting service. 
https://www.netcup.de/vserver/vps.php  
https://www.netcup.de/bestellen/domainangebote.php
<br />
<br />

### [1. Setup your server](setup_server.md)
<br />
 [2. Secure your server](secure_server.md)

