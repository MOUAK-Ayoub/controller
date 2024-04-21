#!/bin/bash

# Installation in centos or amazon linux 2
sudo yum update -y
sudo yum groupinstall -y 'Development Tools'
sudo yum install -y gcc openssl-devel bzip2-devel libffi-devel
wget https://www.python.org/ftp/python/3.9.6/Python-3.9.6.tar.xz
tar xf Python-3.9.6.tar.xz
rm Python-3.9.6.tar.xz
cd Python-3.9.6
./configure prefix=/usr/local/python3.9
sudo make
sudo make install
sudo rm -f /usr/bin/python3
sudo rm -f /usr/bin/pip3
sudo ln -s /usr/local/python3.9/bin/python3.9 /usr/bin/python3
sudo ln -s /usr/local/python3.9/bin/pip3.9 /usr/bin/pip3
python3 --version
pip3 --version
