#!/bin/bash

echo "========================================="
echo "SSH Installation Script"
echo "========================================="

# System aktualisieren
sudo apt update > /dev/null 2>&1

# SSH installieren und aktivieren
sudo apt install -y openssh-server > /dev/null 2>&1
sudo systemctl enable ssh > /dev/null 2>&1
sudo systemctl start ssh > /dev/null 2>&1

echo "SSH ist aktiviert. Du kannst dich über Port 22 verbinden."
echo "========================================="
