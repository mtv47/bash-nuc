Script by mtv47 to set up a nuc debian server with docker

## Description
Script menu that installs all the necessary containers and packages for a simple nuc server


## Usage

```
wget https://raw.githubusercontent.com/mtv47/bash-nuc/main/bootstrap.sh -O bootstrap.sh && bash bootstrap.sh
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
* Tailscale
* Watchtower


## Requirements
* Debian/Ubuntu Server 20.04 or 22.04

## Free port 53

* Add nameservers to resolv.conf

```
sudo systemctl disable systemd-resolved
sudo systemctl stop systemd-resolved
```

```
sudo nano /etc/resolv.conf.manually-configured
```

```
nameserver 8.8.8.8
nameserver 8.8.4.4
```

* Need to execute on reboot
```
sudo ln -s -f /etc/resolv.conf.manually-configured /etc/resolv.conf
```