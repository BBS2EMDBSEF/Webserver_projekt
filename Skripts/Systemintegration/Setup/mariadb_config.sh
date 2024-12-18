#!/bin/bash

# MariaDB installieren
sudo apt update
sudo apt install mariadb-server mariadb-client -y
sudo systemctl start mariadb
sudo systemctl enable mariadb

# Sicherheitsinstallation (ohne Interaktion)
sudo mysql_secure_installation <<EOF
y
n
y
y
y
y
EOF

sudo bash ../Datenbank/db_create.sh

echo "MariaDB ist erfolgreich installiert und konfiguriert."
echo "========================================="
