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
