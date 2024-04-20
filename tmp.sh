#!/bin/bash

git clone https://github.com/MOUAK-Ayoub/controller.git
./scripts/ansible_installation.sh
ansible-playbook  playbooks/main.yml
