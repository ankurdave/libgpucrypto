#!/bin/bash

sudo adduser --disabled-password ankurd
sudo usermod -aG sudo ankurd
sudo bash -c 'echo "ankurd ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/90-ankurd'

wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
sudo apt update
sudo apt -y install cuda
sudo apt -y autoremove

git clone github.com:ankurdave/secure-deep-learning
cd secure-deep-learning
make

git clone github.com:ankurdave/dotfiles
dotfiles/bin/setup

sudo add-apt-repository ppa:ubuntu-elisp/ppa
sudo apt-get update
sudo apt install emacs25
