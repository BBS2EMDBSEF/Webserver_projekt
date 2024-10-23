sudo apt update #Updaten aller installierten Dateien auf den aktuellsten Stand
sudo apt install git #Installation von git, falls nicht vorhanden

git --version

git clone https://github.com/BBS2EMDBSEF/Webserver_projekt.git #Klonen des Repositories, falls Änderungen commited wurden

cd ~/Skripts/Systemintegration/Setup #Navigation zum Setup Ordner
chmod +x webseite_einrichten.sh #Veränderung der Berechtigungen, um webseite_einrichten.sh auszuführen
bash ./webseite_einrichten.sh #Ausführen der webseite_einrichten.sh
