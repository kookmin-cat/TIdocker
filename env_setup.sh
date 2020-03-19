#!/bin/bash 
#
cd $HOME
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install binutils nasm
sudo apt-get -y install gcc-multilib g++-multilib
sudo apt-get -y install libc6-dev-i386
sudo apt-get -y install git
sudo apt-get -y install libc6-dbg libc6-dbg:i386
sudo dpkg --add-architecture i386
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386
sudo apt-get -y install nmap
sudo apt-get -y install python3
sudo apt-get -y install python3-pip libssl-dev
sudo apt-get -y install gdb
sudo pip3 install OTXv2
sudo pip3 install discord
