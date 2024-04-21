#!/bin/bash


chmod +x scripts/*

# Install python
./scripts/python_installation.sh
# Install ansible
./scripts/ansible_installation.sh

# Install jenkins, docker,..etc
ansible-playbook  playbooks/main.yml

# Reboot server
reboot