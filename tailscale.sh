#!/bin/bash

echo "================================================================================"
echo "Adding Tailscale’s package signing key and repository"
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