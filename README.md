# DevOpsify your (Rails) App(s)
What are the benefits of Devopsifying my Webapp(s)?  
- Your Webapps will be updated automatically, after you merge to master - no more heroku push!
- Getting your own Virtual Private Server is cheaper than having a managed host like Heroku, AWS, GCP
- When you add tests to your Webapp, less bugs will slip through to your Users
- You're only gonna have to buy one domain, and will be able to host all your Projects on it with subdomains!
- You're gonna learn some Docker, which is gonna make your life as a Developer easier!

After Reading this Guide you can:
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

# Buy a VPS and Domain
I used netcup for both of this (to have all of my information in one spot), but you can use any domain/hosting service. 
https://www.netcup.de/vserver/vps.php  
https://www.netcup.de/bestellen/domainangebote.php

# Setup your server
I recommend using Debian on your server, since it is easy to use and very stable. CentOS would be a good alternative if you want to learn REDHAT Linux. With netcup Debian comes preinstalled.  
On netcup, you will get and email with your servers IP Adress and a root password, that you can use to login.  
Now use SSH to login to your Server via the Command Line:
```
ssh root@123.456.78.0
```
Add your server to your known hosts.  
After that, your server will ask you for your password. Copy it from your Hosting Provider.  
Now you should be logged in, and the last line should be something like this:
```
root@v2202209103428200491:~#
```

# Change your root password and add a user
After logging in the first time, you should set up a new secure password, that only you know. Right now your root password is available in your emails, so it is not secure.  
type in to your command line:
```
passwd
```
and set your new password
  
# Add a SSH Key to login securely
If you want to watch a video about it:  
https://youtu.be/U_uiVyF6MEs?t=507  

First, lets add a SSH keypair







Next, change your root users password, so that your server can't be hacked after someone 

Then, we will add an admin user with su access. I used my own name.
```

```
