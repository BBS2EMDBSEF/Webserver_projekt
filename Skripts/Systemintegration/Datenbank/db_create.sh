#!/bin/bash

echo "========================================="
echo "Datenbank und Tabelle erstellen"
echo "========================================="

# Create a new database
sudo mysql -u pi -p'raspberry' -e "CREATE DATABASE benutzerDB;"

# Create a new table 'Registrierung' with username and password columns
sudo mysql -u pi -p'raspberry' -e "USE benutzerDB; CREATE TABLE Registrierung (id INT AUTO_INCREMENT PRIMARY KEY, benutzername VARCHAR(255) NOT NULL, passwort VARCHAR(255) NOT NULL);"

echo "Datenbank 'benutzerDB' und Tabelle 'Registrierung' erstellt."
