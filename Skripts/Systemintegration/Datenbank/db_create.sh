CREATE DATABASE my_database; > /dev/null 2>&1
CREATE USER 'my_user'@'%' IDENTIFIED BY 'my_password'; > /dev/null 2>&1
GRANT ALL PRIVILEGES ON my_database.* TO 'my_user'@'%'; > /dev/null 2>&1
FLUSH PRIVILEGES; > /dev/null 2>&1

sudo nano /etc/mysql/mariadb.conf.d/50-server.cnf > /dev/null 2>&1

bind-address = 0.0.0.0 > /dev/null 2>&1

sudo ufw allow 3306 > /dev/null 2>&1
