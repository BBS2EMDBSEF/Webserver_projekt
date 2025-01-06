CREATE DATABASE my_database;
CREATE USER 'my_user'@'%' IDENTIFIED BY 'my_password';
GRANT ALL PRIVILEGES ON my_database.* TO 'my_user'@'%';
FLUSH PRIVILEGES;

sudo nano /etc/mysql/mariadb.conf.d/50-server.cnf

bind-address = 0.0.0.0

sudo ufw allow 3306
