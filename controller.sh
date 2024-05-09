#!/bin/bash

python_version="3.9"

chmod +x scripts/*
is_installed=1
# check if the python version contains 3.9
if ! [[ "$(python3 --version)" =~ ${python_version} ]]
then
    echo "Installing python 3.9.6"
    ./scripts/python_installation.sh
    is_installed=0
fi


if  (( is_installed==1 ))
then
    echo "Installing pip3 "
    sudo yum install -y python3-pip
fi
# Install last ansible version
./scripts/ansible_installation.sh

# Install jenkins, docker,..etc
ansible-playbook  playbooks/main.yml

# If last command executes correctly
if  (( $?==0 ))
then
# Reboot server
sudo reboot
fi
