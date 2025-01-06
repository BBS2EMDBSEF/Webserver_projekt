sudo mariadb

CREATE DATABASE meine_datenbank;

CREATE USER 'benutzername'@'localhost' IDENTIFIED BY 'passwort';
GRANT ALL PRIVILEGES ON meine_datenbank.* TO 'benutzername'@'localhost';
FLUSH PRIVILEGES;
EXIT;

echo "MySQL Konfiguration abgeschlossen."