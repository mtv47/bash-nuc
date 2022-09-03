#!/bin/bash

echo "Update and Upgrade"
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

echo "Installing basics"
sudo apt install nano cifs-utils -y

echo "unattended-upgrades"
sudo apt install unattended-upgrades -y
sudo dpkg-reconfigure --priorit=low unattended-upgrades

echo "Testing if unattended-upgrades is working"
sudo unattended-upgrade --debug

echo "Installing Fail2Ban"
sudo apt install fail2ban -y
sudo systemctl enable fail2ban --now

echo "Testing if Fail2Ban is working"
sudo systemctl status fail2ban
sudo fail2ban-client status
sudo fail2ban-client status sshd

echo "Installing UFW"
sudo apt install ufw -y
sudo ufw default allow outgoing
sudo ufw default deny incoming
sudo ufw enable ssh
sudo ufw enable 80
sudo ufw enable 53
sudo ufw enable 2080
sudo ufw enable 51820/udp
sudo ufw enable 3001
sudo ufw start