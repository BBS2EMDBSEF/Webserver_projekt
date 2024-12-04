#!/bin/bash

echo "========================================="
echo "SSH Installation Script"
echo "========================================="

# System aktualisieren
echo "System wird aktualisiert..."
sudo apt update && sudo apt upgrade -y

# SSH installieren und aktivieren
echo "SSH wird installiert..."
sudo apt install -y openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh

echo "SSH ist aktiviert. Du kannst dich über Port 22 verbinden."
echo "========================================="
