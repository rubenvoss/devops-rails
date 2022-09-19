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

## Install Caddyserver
Install a stable release:
https://caddyserver.com/docs/install#debian-ubuntu-raspbian
### Check if caddyserver is working:
make a simple html file
```
cd
touch index.html
nano index.html
```
write something like `<h1>hello caddy!</h1>` into your html file and save it with ctrl + x.
Start a Caddy file-server with
```
caddy file-server --listen :2015
```
and go to your server ip in your Browser. That's the ip you used with the `ssh root@123.456.789.0` command. Add the caddy port to your ip, so that it looks like this:
123.456.789.0:2015
If you see your static page, congrats! If not, send me a message on Github :)


because netcup doesnt allow listening on low ports

## Install Docker
https://docs.docker.com/engine/install/debian/
https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user

## Install Watchtower


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
