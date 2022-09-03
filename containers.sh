#!/bin/bash

#Installing Watchtower
sudo docker run -d \
 --name watchtower \
 -v /var/run/docker.sock:/var/run/docker.sock \
 containrrr/watchtower:latest \
 --run-once \
 --cleanup \
 --include-restarting \
 --include-stopped

echo "================================================================================"
echo "Installing portainer"
cd $PATH_TO_SCRIPTS
mkdir $HOME/portainer_data
cd portainer
docker-compose up -d

echo "================================================================================"
echo "Installing pihole"
cd $PATH_TO_SCRIPTS
mkdir $HOME/pihole_data
cd pihole
#Request a password for the pihole admin panel
echo "================================================================================"
echo "Please enter a password for the pihole admin panel"
read -s pihole_password
docker-compose up -d

echo "================================================================================"
echo "Installing WIREGUARD"
cd $PATH_TO_SCRIPTS
mkdir $HOME/wireguard_data
cd wireguard
#Request the ip address for the dns server
echo "================================================================================"
echo "Please enter the ip address for the dns server"
read dns_server_ip
docker-compose up -d

echo "================================================================================"
echo "Installing Uptime-Kuma"
cd $PATH_TO_SCRIPTS
mkdir $HOME/uptime-kuma_data
cd uptime-kuma
docker-compose up -d

