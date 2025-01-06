#!/bin/bash

# System aktualisieren
sudo apt update

# SSH installieren und aktivieren
sudo apt install -y openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh

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
