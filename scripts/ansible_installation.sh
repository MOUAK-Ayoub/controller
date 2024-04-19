#!/bin/bash

python3 -m pip install --user ansible

# work after reboot, maybe because I installed ansible with yum before
ansible --version