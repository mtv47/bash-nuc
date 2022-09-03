Script by mtv47 to set up a nuc debian server with docker

## Description
Script menu that installs all the necessary containers and packages for a simple nuc server


## Usage

```
wget https://raw.githubusercontent.com/mtv47/bash-nuc/main/bootstrap.sh -O bootstrap.sh && sudo bash bootstrap.sh
```

## Features
* Docker and Docker Compose
* Setting up containers
* Unattended-upgrades
* Fail2Ban
* UFW

## Docker Containers
* Pihole
* Portainer
* UptimeKuruma
* Wireguard
* Watchtower


## Requirements
* Debian/Ubuntu Server 20.04 or 22.04