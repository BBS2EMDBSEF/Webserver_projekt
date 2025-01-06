apt update

apt install -y language-pack-de
update-locale LANG=de_DE.UTF-8 LC_MESSAGES=POSIX

timedatactl set-timezone Europe/Berlin

sudo apt-get update

sudo apt install git -y

sudo nano git_klonen.sh

sudo apt install -y openssh-server

sudo apt install mariadb-server -y
sudo mysql_secure_installation

sudo apt install -y phpmyadmin

sudo nano php_config.sh

sudo nano mysql_config.sh

echo "Konfiguration abgeschlossen. Du kannst jetzt auf deinen Server zugreifen."