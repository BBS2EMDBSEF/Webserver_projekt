#!/bin/bash

RED='\033[31m'
GREEN='\033[32m'
RESET='\033[0m'

if [ -f "ssh.sh" ]; then
    echo chmod +x ssh.sh
    echo -e "${GREEN}ssh.sh gefunden. Skript wird jetzt ausgeführt...${RESET}"
    sudo bash ../SSH/ssh.sh # Wechsle auf die ssh.sh im Verzeichnis ../SSH
else
    echo -e "${RED}ssh.sh nicht gefunden. Bitte stelle sicher, dass setup.sh im selben Verzeichnis liegt.${RESET}"
fi

if [ -f "php_config.sh" ]; then
    echo -e "${GREEN}php_config.sh gefunden. Skript wird jetzt ausgeführt...${RESET}"
    sudo bash php_config.sh # Wechsle auf die php_config.sh
else
    echo -e "${RED}php_config.sh nicht gefunden. Bitte stelle sicher, dass setup.sh im selben Verzeichnis liegt.${RESET}"
fi

if [ -f "apache_config.sh" ]; then
    echo -e "${GREEN}apache_config.sh gefunden. Skript wird jetzt ausgeführt...${RESET}"
    sudo bash apache_config.sh # Wechsle auf die apache_config.sh
else
    echo -e "${RED}apache_config.sh nicht gefunden. Bitte stelle sicher, dass setup.sh im selben Verzeichnis liegt.${RESET}"
fi

if [ -f "mariadb_config.sh" ]; then
    echo -e "${GREEN}mariadb_config.sh gefunden. Skript wird jetzt ausgeführt...${RESET}"
    sudo bash mariadb_config.sh # Wechsle auf die mariadb_config.sh
else
    echo -e "${RED}mariadb_config.sh nicht gefunden. Bitte stelle sicher, dass setup.sh im selben Verzeichnis liegt.${RESET}"
fi

if [ -f "Firewall_Regeln.sh" ]; then
    echo -e "${GREEN}Firewall_Regeln.sh gefunden. Skript wird jetzt ausgeführt...${RESET}"
    sudo bash ../Fireewall_Port/Firewall_Regeln.sh # Wechsle auf die Firewall_Regeln.sh
else
    echo -e "${RED}Firewall_Regeln.sh nicht gefunden. Bitte stelle sicher, dass setup.sh im selben Verzeichnis liegt.${RESET}"
fi

if [ -f "db_create.sh" ]; then
    echo -e "${GREEN}db_create.sh gefunden. Skript wird jetzt ausgeführt...${RESET}"
    sudo bash ../Datenbank/db_create.sh # Wechsle auf die db_create.sh
else
    echo -e "${RED}db_create.sh nicht gefunden. Bitte stelle sicher, dass setup.sh im selben Verzeichnis liegt.${RESET}"
fi