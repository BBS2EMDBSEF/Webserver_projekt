#!/bin/bash

echo "========================================="
echo "Apache Installation Script"
echo "========================================="

# Apache installieren
echo "Apache wird installiert..."
sudo apt install -y apache2

# Apache starten
sudo systemctl enable apache2
sudo systemctl start apache2

echo "Apache ist erfolgreich installiert und aktiv."
echo "========================================="
