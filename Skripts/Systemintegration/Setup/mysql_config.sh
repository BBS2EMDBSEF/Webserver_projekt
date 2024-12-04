sudo apt update
sudo apt install mysql-server
sudo mysql_secure_installation

sudo systemctl start mysql
sudo systemctl enable mysql

sudo mysql -u root -p