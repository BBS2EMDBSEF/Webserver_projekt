#!/bin/bash

# Apache installieren
sudo apt install -y apache2
sudo systemctl enable apache2
sudo systemctl start apache2

sudo cp -r Skripts/Anwendungsentwicklung/* /var/www/html/

sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/

sudo systemctl restart apache2

echo "Apache ist erfolgreich installiert und aktiv."
echo "========================================="
