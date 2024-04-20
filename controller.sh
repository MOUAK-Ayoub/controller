#!/bin/bash

USER="cloud_user"
# log as root and let the use sudo without password
sudo -i
sudo echo "$USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
exit

#Install git
sudo yum install -y git

git clone https://github.com/MOUAK-Ayoub/controller.git
cd controller
# Install python
./scripts/python_installation.sh
# Install ansible
./scripts/ansible_installation.sh

# Install jenkins, docker,..etc
ansible-playbook  playbooks/main.yml
