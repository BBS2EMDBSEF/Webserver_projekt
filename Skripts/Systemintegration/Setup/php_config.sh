#!/bin/bash

echo "========================================="
echo "PHP Installation Script"
echo "========================================="

# PHP und Module installieren
sudo apt install -y php php-mysql libapache2-mod-php > /dev/null 2>&1

# Symbolischen Link für phpMyAdmin setzen
sudo ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin > /dev/null 2>&1

echo "PHP ist erfolgreich installiert."
echo "========================================="
