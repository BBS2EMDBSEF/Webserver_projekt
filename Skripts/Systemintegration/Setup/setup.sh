apt update

apt install -y language-pack-de
update-locale LANG=de_DE.UTF-8 LC_MESSAGES=POSIX

timedatactl set-timezone Europe/Berlin

sudo apt-get update

sudo apt install git -y

apt install -y openssh-server

apt install -y mysql-server

sudo nano mysql_config.sh

apt install -y phpmyadmin

sudo nano php_config.sh

systemctl start mysql

systemctl enable mysql

systemctl status mysql

ufw allow OpenSSH
ufw allow mysql

ufw enable

echo "Konfiguration abgeschlossen. Du kannst jetzt auf deinen Server zugreifen."