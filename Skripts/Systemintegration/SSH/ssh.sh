#!/bin/bash

echo "========================================="
echo "SSH Installation"
echo "========================================="

# Überprüfung, ob das Skript mit root-Rechten ausgeführt wird
if [[ $EUID -ne 0 ]]; then
   echo "Dieses Skript muss mit root-Rechten ausgeführt werden!" >&2
   exit 1
fi

# Installieren von SSH, falls es nicht bereits installiert ist
echo "Überprüfen, ob SSH installiert ist..."
if ! dpkg -l | grep -q openssh-server; then
    echo "SSH wird installiert..."
    apt update && apt install -y openssh-server
    echo "SSH wurde erfolgreich installiert."
else
    echo "SSH ist bereits installiert."
fi

# Aktivieren des SSH-Dienstes
echo "Aktivieren des SSH-Dienstes..."
systemctl enable ssh
systemctl start ssh

# Bestätigung der Aktivierung
echo "Überprüfen, ob SSH aktiv ist..."
if systemctl is-active --quiet ssh; then
    echo "SSH-Dienst wurde erfolgreich aktiviert und gestartet."
else
    echo "Fehler: SSH-Dienst konnte nicht gestartet werden!" >&2
    exit 1
fi

# Sicherheit: Standardpasswort ändern
DEFAULT_USER="pi"
echo "Ändern des Standardpassworts für Benutzer '$DEFAULT_USER'..."
passwd $DEFAULT_USER

# Anzeige der aktuellen IP-Adresse
echo "Ermitteln der IP-Adresse des Raspberry Pi..."
IP_ADDRESS=$(hostname -I | awk '{print $1}')
if [[ -n "$IP_ADDRESS" ]]; then
    echo "Die aktuelle IP-Adresse des Raspberry Pi ist: $IP_ADDRESS"
else
    echo "Warnung: Konnte die IP-Adresse nicht automatisch ermitteln. Bitte überprüfen Sie Ihre Netzwerkeinstellungen."
fi

# Abschlussmeldung
echo "SSH ist jetzt aktiviert. Verbinden Sie sich mit folgendem Befehl:"
echo "    ssh $DEFAULT_USER@$IP_ADDRESS"
echo "(Falls Sie die IP-Adresse nicht kennen, prüfen Sie Ihren Router oder verwenden Sie 'arp -a' im Netzwerk.)"