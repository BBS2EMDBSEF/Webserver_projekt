#!/bin/bash

# Apache installieren
sudo apt install -y apache2
sudo systemctl enable apache2
sudo systemctl start apache2

echo "Apache ist erfolgreich installiert und aktiv."
echo "========================================="
