#!/bin/bash

# Apache installieren
sudo apt install -y apache2 > /dev/null 2>&1
sudo systemctl enable apache2 > /dev/null 2>&1
sudo systemctl start apache2 > /dev/null 2>&1

echo "Apache ist erfolgreich installiert und aktiv."
echo "========================================="
