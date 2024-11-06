echo "mysql-server mysql-server/root_password password admin" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password admin" | debconf-set-selections

mysql -u admin -p admin -e "CREATE USER 'Service'@'localhost' IDENTIFIED BY 'Admin';"
mysql -u admin -p admin -e "GRANT ALL PRIVILEGES ON *.* TO 'Service'@'localhost' WITH GRANT OPTIONS;"
mysql -u admin -p admin -e "FLUSH PRIVILEGES;"

echo "MySQL Konfiguration abgeschlossen."