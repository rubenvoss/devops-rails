# Let's secure your server
If you want to watch a video about it:
https://youtu.be/Bx_HkLVBz9M
<br />

## Automatically install updates with unattended-upgrades
```
sudo apt install unattended-upgrades
```
```
sudo dpkg-reconfigure --priority low unattended-upgrades
```
## Setup a firewall with ufw
```
sudo apt install ufw
```
**IMPORTANT:** allow SSH access (if you don't do this, you will be locked out of your server).
```
sudo ufw allow 22
sudo ufw allow OpenSSH
```
## Install fail2ban
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

And save with Ctrl + X


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
