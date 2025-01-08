#!/bin/bash

RED='\033[31m'
GREEN='\033[32m'
RESET='\033[0m'

echo "========================================="
echo "Raspberry Pi Initial Setup"
echo "========================================="

echo "System wird aktualisiert..."
sudo apt upgrade
sudo apt update

echo "Initial Setup abgeschlossen. Wechsel zu setup.sh..."
if [ -f "setup.sh" ]; then
    echo "${GREEN}setup.sh gefunden. Skript wird jetzt ausgeführt...${RESET}"
    sudo bash setup.sh #Wechsel auf die setup.sh
else
    echo "${RED}setup.sh nicht gefunden. Bitte stelle sicher, dass setup.sh im selben Verzeichnis liegt.${RESET}"
fi
