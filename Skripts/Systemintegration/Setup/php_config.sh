#!/bin/bash

echo "========================================="
echo "PHP Installation Script"
echo "========================================="

# PHP installieren
echo "PHP und notwendige Module werden installiert..."
sudo apt install -y php php-mysql libapache2-mod-php
sudo ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin

echo "PHP ist erfolgreich installiert."
echo "========================================="
