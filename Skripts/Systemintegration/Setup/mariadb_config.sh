#!/bin/bash

# MariaDB installieren
sudo apt update > /dev/null 2>&1
sudo apt install mariadb-server mariadb-client -y > /dev/null 2>&1
sudo systemctl start mariadb > /dev/null 2>&1
sudo systemctl enable mariadb > /dev/null 2>&1

# Sicherheitsinstallation (ohne Interaktion)
sudo mysql_secure_installation <<EOF > /dev/null 2>&1
y
n
y
y
y
y
EOF

sudo bash ../Datenbank/db_create.sh > /dev/null 2>&1

echo "MariaDB ist erfolgreich installiert und konfiguriert."
echo "========================================="
