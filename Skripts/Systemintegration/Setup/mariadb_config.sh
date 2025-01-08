#!/bin/bash

echo "========================================="
echo "MariaDB Installation"
echo "========================================="

# Update the package index
sudo apt update

# Install MariaDB server and client
sudo apt install mariadb-server mariadb-client -y

# Start and enable MariaDB service
sudo systemctl start mariadb
sudo systemctl enable mariadb

# Secure MariaDB installation
sudo mysql_secure_installation <<EOF
y
n
y
y
y
y
EOF

# Set root username to 'pi' and root password to 'raspberry'
sudo mysql -e "UPDATE mysql.user SET User='pi' WHERE User='root';"
sudo mysql -e "UPDATE mysql.user SET Password=PASSWORD('raspberry') WHERE User='pi';"
sudo mysql -e "FLUSH PRIVILEGES;"

# Optional: Remove the default 'root' user (if desired)
sudo mysql -e "DROP USER 'root'@'localhost';"
