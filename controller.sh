#!/bin/bash

python_version="Python 3.9.6"
[[ $(python3 --version) == $python_version ]]; is_correct_version=$?

chmod +x scripts/*

if  (( is_correct_version==1 ))
then
    # Install python 3.9.6
    ./scripts/python_installation.sh
fi

# Install last ansible version
./scripts/ansible_installation.sh

# Install jenkins, docker,..etc
ansible-playbook  playbooks/main.yml

if  (( $?==0 ))
then
# Reboot server
sudo reboot
fi
