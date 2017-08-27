#!/bin/bash
#This script is written on Aug 26 2017
#It logs the boot time of current system startup

date > date.txt

today=$(sed 's/\ /_/g' date.txt)

#Create directory with date
mkdir $today

cd $today

#Log the boot performance
systemd-analyze > boot.txt
systemd-analyze blame > blame.txt
systemd-analyze critical-chain > crtical_chain.txt
systemd-analyze plot > plot.svg

cd ..

#remove date.txt file created for temporary purpose
echo "Removing date.txt file"
rm -v date.txt
