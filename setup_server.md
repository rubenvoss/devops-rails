# Setup your server
On AWS, you have to launch an EC2 instance, set Debian as your OS, configure a security group that allows http traffic and SSH traffic and set a SSH keypair or a password to login.

## Security Group
On AWS, make a security policy and expose ports 22 for SSH, 80 for HTTP and Port 9000 as a Custom TCP (source 0.0.0.0/0)
![security_group](https://user-images.githubusercontent.com/105738004/193949224-90433bf1-a336-4ca9-b373-dd4b9ba1ea1c.jpg)
<br>


Once it is launched, login with SSH and use admin as a user:
```
ssh admin@123.456.78.0
```
Add your server to your known hosts.
After that, your server will ask you for your password. Copy it from your Hosting Provider.
Now you should be logged in, and the last line should be something like this:
```
admin@v2202209103428200491:~#
```

## Change your password
Do this if you don't use a SSH keypair:
After logging in the first time, you should set up a new secure password, that **only you** know.
type in to your command line:
```
passwd
```

## Install everything you need to your server with this script:
```
bash <(curl -s https://raw.githubusercontent.com/rubenvoss/server-files-debian-11/main/setup_debian_11.sh)
```
check if stuff was installed:
```
# check for the status of nginx - should be active
systemctl status nginx
# check for docker
docker run hello-world
# check for webhook
systemctl status webhook
```
