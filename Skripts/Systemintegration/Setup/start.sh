#!/bin/bash

echo "========================================="
echo "Raspberry Pi Initial Setup Script"
echo "========================================="

# 1. System aktualisieren und upgraden
echo "System wird aktualisiert..."
sudo apt update && sudo apt upgrade -y

# 2. Zeitzone einstellen
echo "Zeitzone wird eingestellt (z.B., Europe/Berlin)..."
sudo timedatectl set-timezone Europe/Berlin

# 3. Hostname ändern (optional)
DEFAULT_HOSTNAME="raspberrypi"
echo "Standard-Hostname ist '$DEFAULT_HOSTNAME'. Möchtest du den Hostname ändern? (y/n)"
read -r CHANGE_HOSTNAME
if [ "$CHANGE_HOSTNAME" = "y" ]; then
    echo "Neuen Hostname eingeben:"
    read -r NEW_HOSTNAME
    sudo hostnamectl set-hostname "$NEW_HOSTNAME"
    echo "Hostname wurde zu '$NEW_HOSTNAME' geändert."
else
    echo "Hostname bleibt '$DEFAULT_HOSTNAME'."
fi

# 4. SSH aktivieren (optional, falls noch nicht aktiv)
echo "Möchtest du SSH aktivieren? (y/n)"
read -r ENABLE_SSH
if [ "$ENABLE_SSH" = "y" ]; then
    echo "SSH wird aktiviert..."
    sudo systemctl enable ssh
    sudo systemctl start ssh
    echo "SSH ist jetzt aktiviert."
else
    echo "SSH wird nicht aktiviert."
fi

# 5. Speicher erweitern (Raspberry Pi spezifisch)
echo "Speichererweiterung (resize filesystem)..."
sudo raspi-config nonint do_expand_rootfs
echo "Speichererweiterung abgeschlossen. Ein Neustart ist erforderlich, wird aber später durchgeführt."

# 6. Neueste Firmware installieren
echo "Neueste Firmware installieren (falls erforderlich)..."
sudo rpi-update

# 7. Wechsel zu `setup.sh`
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
