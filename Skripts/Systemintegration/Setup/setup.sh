apt update

apt install -y language-pack-de
update-locale LANG=de_DE.UTF-8 LC_MESSAGES=POSIX

timedatactl set-timezone Europe/Berlin

sudo apt-get update

sudo apt install -y openssh-server

sudo bash ../SSH/ssh.sh

sudo apt install -y phpmyadmin

sudo bash php_config.sh

sudo bash apache_config.sh

sudo bash mariadb_config.sh

echo "Konfiguration abgeschlossen. Du kannst jetzt auf deinen Server zugreifen."