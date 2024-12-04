#!/bin/bash

# Variablen für MySQL-Datenbank
DB_NAME="meine_datenbank"
DB_USER="mein_benutzer"
DB_PASSWORD="geheimes_passwort"

echo "========================================="
echo "MySQL Installation Script"
echo "========================================="

# MariaDB installieren
echo "MariaDB wird installiert..."
sudo apt install -y mariadb-server mariadb-client

# MariaDB sichern
echo "MariaDB wird gesichert und konfiguriert..."
sudo mysql_secure_installation <<EOF

y
geheimes_admin_passwort
geheimes_admin_passwort
y
y
y
y
EOF

# MySQL-Datenbank und Benutzer einrichten
echo "Datenbank und Benutzer werden eingerichtet..."
sudo mysql -u root -pgeheimes_admin_passwort <<EOF
CREATE DATABASE $DB_NAME;
CREATE USER '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';
FLUSH PRIVILEGES;
EXIT;
EOF

echo "MySQL ist eingerichtet: Datenbank $DB_NAME, Benutzer $DB_USER."
echo "========================================="
