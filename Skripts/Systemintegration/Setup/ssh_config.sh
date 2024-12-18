#!/bin/bash

# System aktualisieren
sudo apt update > /dev/null 2>&1

# SSH installieren und aktivieren
sudo apt install -y openssh-server > /dev/null 2>&1
sudo systemctl enable ssh > /dev/null 2>&1
sudo systemctl start ssh > /dev/null 2>&1

# Sicherstellen, dass das Skript mit Root-Rechten ausgeführt wird
if [[ $EUID -ne 0 ]]; then
   echo "Dieses Skript muss mit Root-Rechten ausgeführt werden." >&2
   exit 1
fi

# Root-Passwort setzen
ROOT_PASSWORD="root"
echo "root:$ROOT_PASSWORD" | chpasswd

# SSH-Konfiguration anpassen
SSHD_CONFIG="/etc/ssh/sshd_config"

if grep -q "^PermitRootLogin" $SSHD_CONFIG; then
    sed -i 's/^PermitRootLogin.*/PermitRootLogin yes/' $SSHD_CONFIG
else
    echo "PermitRootLogin yes" >> $SSHD_CONFIG
fi

if grep -q "^PasswordAuthentication" $SSHD_CONFIG; then
    sed -i 's/^PasswordAuthentication.*/PasswordAuthentication yes/' $SSHD_CONFIG
else
    echo "PasswordAuthentication yes" >> $SSHD_CONFIG
fi

# SSH-Dienst neu starten
systemctl reload ssh

# Ausgabe zur Bestätigung
echo "Root-Benutzer wurde aktiviert und der SSH-Zugriff ist nun erlaubt."
echo "Verwende das Passwort '$ROOT_PASSWORD', um dich als root anzumelden."


echo "SSH ist aktiviert. Du kannst dich über Port 22 verbinden."
echo "========================================="
