#!/bin/bash

echo "========================================="
echo "Raspberry Pi Initial Setup Script"
echo "========================================="

# 1. System aktualisieren und upgraden
echo "System wird aktualisiert..."
sudo apt upgrade
sudo apt update

# 2. Zeitzone einstellen
echo "Zeitzone wird eingestellt (z.B., Europe/Berlin)..."
sudo timedatectl set-timezone Europe/Berlin

# 3. Wechsel zu `setup.sh`
echo "Initial Setup abgeschlossen. Wechsel zu setup.sh..."
if [ -f "setup.sh" ]; then
    echo "setup.sh gefunden. Skript wird jetzt ausgeführt..."
    sudo bash setup.sh
else
    echo "setup.sh nicht gefunden. Bitte stelle sicher, dass setup.sh im selben Verzeichnis liegt."
    echo "Beende Initial Setup."
fi

echo "========================================="
echo "Initial Setup abgeschlossen!"
echo "========================================="
