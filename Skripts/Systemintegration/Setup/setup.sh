apt update

apt install -y language-pack-de
update-locale LANG=de_DE.UTF-8 LC_MESSAGES=POSIX

timedatactl set-timezone Europe/Berlin

sudo apt-get update

#apt install -y git

#TARGET_DIR="$HOME/Skripts/Systemintegration/Setup/"

#if [ -d "$TARGET_DIR" ]; then
#    echo "Das Verzeichnis $TARGET_DIR existiert bereits. Kein Klonen erforderlich."
#else
#    echo "Klone das Repository..."
#    git clone https://github.com/BBS2EMDBSEF/Webserver_projekt.git $TARGET_DIR
#fi

apt install -y openssh-server

apt install -y mysql-server

echo "mysql-server mysql-server/root_password password admin" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password admin" | debconf-set-selections

mysql -u admin -p admin -e "CREATE USER 'Service'@'localhost' IDENTIFIED BY 'Admin';"
mysql -u admin -p admin -e "GRANT ALL PRIVILEGES ON *.* TO 'Service'@'localhost' WITH GRANT OPTIONS;"
mysql -u admin -p admin -e "FLUSH PRIVILEGES;"

apt install -y phpmyadmin

echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
echo "phpmyadmin phpmyadmin/app-password-confirm password admin" | debconf-set-selections
echo "admin"
echo "phpmyadmin phpmyadmin/mysql/admin-pass password admin" | debconf-set-selections
echo "admin"
echo "phpmyadmin phpmyadmin/mysql/app-pass password admin" | debconf-set-selections
echo "admin"
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect nginx" | debconf-set-selections

systemctl start mysql

systemctl enable mysql

systemctl status mysql

ufw allow OpenSSH
ufw allow mysql

ufw enable

echo "Konfiguration abgeschlossen. Du kannst jetzt auf deinen Server zugreifen."