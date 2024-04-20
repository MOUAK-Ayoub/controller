-- Installation


```bash
USER="cloud_user"
# log as root and let the use sudo without password
sudo -i
sudo echo "$USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
exit

sudo yum install -y git

git clone https://github.com/MOUAK-Ayoub/controller.git
cd controller
chmod +x controller.sh
# Execute script
.\controller.sh
```