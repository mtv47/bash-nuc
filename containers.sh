#!/bin/bash

PATH_TO_SCRIPTS="$HOME/bash-nuc"
mkdir $HOME/docker_data
DOCKER_DATA="$HOME/docker_data"


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
echo "Installing Nginx Proxy Manager"
cd $PATH_TO_SCRIPTS/nginx
sudo USED_DOCKER_DATA=$DOCKER_DATA docker-compose up -d


echo "================================================================================"
echo "Installing Portainer"
cd $PATH_TO_SCRIPTS/portainer
sudo USED_DOCKER_DATA=$DOCKER_DATA docker-compose up -d


echo "================================================================================"
echo "Installing Homarr"
cd $PATH_TO_SCRIPTS/homarr
sudo USED_DOCKER_DATA=$DOCKER_DATA docker-compose up -d


echo "================================================================================"
echo "Installing Uptime-Kuma"
cd $PATH_TO_SCRIPTS/uptime-kuma
sudo USED_DOCKER_DATA=$DOCKER_DATA docker-compose up -d


echo "================================================================================"
echo "Installing Pihole"
cd $PATH_TO_SCRIPTS/pihole
#Request a password for the pihole admin panel
echo "================================================================================"
echo "Please enter a password for the pihole admin panel"
read -s pihole_password
echo "================================================================================"
echo "Freeing up port 53"
sudo echo "DNS=9.9.9.9" >> /etc/systemd/resolved.conf
sudo echo "FallbackDNS=8.8.8.8" >> /etc/systemd/resolved.conf
sudo ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf
sudo systemctl disable systemd-resolved
sudo systemctl stop systemd-resolved
sudo USED_DOCKER_DATA=$DOCKER_DATA USE_PIHOLE_PASSWD=$pihole_password docker-compose up -d


echo "================================================================================"
echo "List all docker running containers"
sudo docker ps
