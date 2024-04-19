#!/bin/bash

USER="cloud_user"
# log as root and let the use sudo without password
sudo -i
sudo echo "$USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
exit

#Install git
sudo yum install -y git

# Install python
./scripts/python_installation.sh
./scripts/ansible_installation.sh