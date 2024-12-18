#!/bin/bash

# PHP und Module installieren
sudo apt install -y php php-mysql libapache2-mod-php

# Symbolischen Link für phpMyAdmin setzen
sudo ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin

echo "PHP ist erfolgreich installiert."
echo "========================================="
