#!/bin/bash

echo "================================================================================"
echo "Adding Tailscales package signing key and repository"
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/jammy.noarmor.gpg | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/jammy.tailscale-keyring.list | sudo tee /etc/apt/sources.list.d/tailscale.list

echo "================================================================================"
echo "Installing Tailscale"
sudo apt-get update
sudo apt-get install tailscale

echo "================================================================================"
echo "Starting Tailscale"
sudo tailscale up

echo "================================================================================"
echo "Tailscale Status"
sudo tailscale status

echo "================================================================================"
echo "Tailscale IPv4"
sudo tailscale ip -4

echo "================================================================================"
echo "Enabling IP forwarding"
echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.conf
echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.conf
sudo sysctl -p /etc/sysctl.conf
sudo tailscale up --advertise-routes=192.168.0.0/24 --accept-dns=true --advertise-exit-node