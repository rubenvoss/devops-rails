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

### [Setup your server](server_setup.md)

# Setup your server
With netcup Debian comes preinstalled.  
I recommend using Debian on your server, since it is easy to use and very stable. CentOS would be a good alternative if you want to learn REDHAT Linux. 
On netcup, you will get and email with your servers IP Adress and a root password.  
Use this info to login with SSH:  
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
After logging in the first time, you should set up a new secure password, that **only you** know. Right now your root password is available in your emails, so it is not secure.  
type in to your command line:
```
passwd
```
and set your new password.  
<br />
Now, lets add a sudo user - I will use my name as a username.  
```
adduser ruben
```
After adding your password and other information - you can leave the other info empty if you want - lets add the user 'ruben' as a sudo user, so that the user can execute sudo commands.
```
usermod -aG sudo ruben
```
Now lets logout and log back in as 'ruben'
```
exit
```
```
ssh ruben@123.456.78.0
```
You last line should be something like this:
```
ruben@v2202209103428200491:~#
```  
<br />


# Let's secure your server
If you want to watch a video about it:  
https://youtu.be/Bx_HkLVBz9M
<br />

**Automatically install updates with unattended-upgrades**
```
sudo apt install unattended-upgrades
```
```
sudo dpkg-reconfigure --priority low unattended-upgrades
```
**Setup a firewall with ufw**
```
sudo apt install ufw
```
IMPORTANT: allow SSH access (if you don't do this, you will be locked out of your server).
```
sudo ufw allow 22
sudo ufw allow OpenSSH
```
**Install fail2ban**
```
sudo apt-get install -y fail2ban
sudo systemctl start fail2ban
sudo systemctl enable fail2ban
```

go to jail.local file to set up config
```
cd /etc/fail2ban

sudo nano jail.local
```

Insert the following code:  
```
[sshd]
enabled = true
port = 22
filter = sshd
logpath = /var/log/auth.log
maxretry = 4
```

# Setting up your server
**Add autocompletion, so you can use tab to autocomplete filenames.**  
```
sudo apt update
sudo apt install bash-completion
```
logout from your server with  
```
exit
```

**Docker**
https://docs.docker.com/engine/install/debian/  
https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user  

**Watchtower**


<!-- This is commented out.
# Add a SSH Key to login securely
If you want to watch a video about it:  
https://youtu.be/U_uiVyF6MEs?t=507  

First, lets add a SSH keypair. I recommend adding a password to your ssh keypair.
```
ssh-keygen
```
If you give a name to your ssh keyfiles, they will be saved in your home folder.  
I called my file rubenvoss_server.pub on my local machine and rubenvoss_server_rsa.pub on my server.
Now copy your keyfile pair to your server:
```
cd
scp rubenvoss_server.pub ruben@188.68.51.63:~/rubenvoss_server_rsa.pub
```
Now login to your server and check if it is there - with cd & ls.
<br />
Next, add your SSH key to your authorized_keys:
```
mkdir .ssh
cd .ssh
touch authorized_keys
cd
```
exit the ssh and log back in again.
```
exit
```
-->

