### Installation


```bash
# log as root and let the user sudo without password
sudo -i
# Put your user here
USER="cloud_user"
echo "$USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
exit

sudo yum install -y git

git clone https://github.com/MOUAK-Ayoub/controller.git
cd controller
chmod +x controller.sh




# Execute script
./controller.sh
```

### Tested on Centos 7 and RHEL 8

