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

## Change your root password and add a user
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




## Add autocompletion, so you can use tab to autocomplete filenames.
```
sudo apt update
sudo apt install bash-completion
```

## Install Docker
https://docs.docker.com/engine/install/debian/
https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user


## Install nginx Server
With this you can serve your Webapps to your users. We're gonna use it as a reverse proxy to host multiple Webapps on one Website with subdomains like so:
  - project1.website.com
  - project2.website.com
  - profile.website.com
  - website.com

### Let's get it working
First, lets run nginx in a docker container to get the basics working.
```
docker run --name mynginx1 -p 80:80 -d nginx
```
Go to your servers IP adress and check if you see the nginx welcome page.
