### Installation


## Setup variables.yaml 
After the git clone you need to put the versions that you want in the variable.yaml
Pay attention to the compatability of version
the repo was tested on:
RHEL 8
Java version: 11
maven: 3.8.5
jenkins : 2.440.3
jenkins plugin manager: 2.12.15

#### Change the hostname and user 
```bash
# log as root and let the user sudo without password
sudo -i
# Put your user here
USER="cloud_user"
echo "$USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
exit

sudo yum install -y git tmux

git clone https://github.com/MOUAK-Ayoub/controller.git
cd controller
chmod +x controller.sh


# Execute script
# Using tmux (screen is deprecated) will be better 
./controller.sh
```


The jenkins port is: 8080
The artifactory port is: 8081

