#!/bin/bash

python_version="3.9"

chmod +x scripts/*

# check if the python version contains 3.9
if ! [[ "$(python3 --version)" =~ ${python_version} ]]
then
    echo "Installing python 3.9.6"
    ./scripts/python_installation.sh
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
