#!/bin/bash

echo "========================================="
echo "             SSH Installation            "
echo "========================================="

# Farben für die Ausgabe
RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
RESET='\033[0m'

# Überprüfung, ob das Skript mit root-Rechten ausgeführt wird
if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}Fehler: Dieses Skript muss mit root-Rechten ausgeführt werden!${RESET}" >&2
    exit 1
fi

# Installieren von SSH, falls es nicht bereits installiert ist
echo -e "${YELLOW}Überprüfen, ob SSH installiert ist...${RESET}"
if ! dpkg -l | grep -q openssh-server; then
    echo -e "${YELLOW}SSH wird installiert...${RESET}"
    apt update && apt install -y openssh-server
    echo -e "${GREEN}SSH wurde erfolgreich installiert.${RESET}"
else
    echo -e "${GREEN}SSH ist bereits installiert.${RESET}"
fi

# Aktivieren des SSH-Dienstes
echo -e "${YELLOW}Aktivieren des SSH-Dienstes...${RESET}"
systemctl enable ssh
systemctl start ssh

# Bestätigung der Aktivierung
echo -e "${YELLOW}Überprüfen, ob SSH aktiv ist...${RESET}"
if systemctl is-active --quiet ssh; then
    echo -e "${GREEN}SSH-Dienst wurde erfolgreich aktiviert und gestartet.${RESET}"
else
    echo -e "${RED}Fehler: SSH-Dienst konnte nicht gestartet werden!${RESET}" >&2
    exit 1
fi

# Sicherheit: Standardpasswort ändern
DEFAULT_USER="pi"
echo -e "${YELLOW}Ändern des Standardpassworts für Benutzer '$DEFAULT_USER'...${RESET}"
passwd $DEFAULT_USER

# Anzeige der aktuellen IP-Adresse
echo -e "${YELLOW}Ermitteln der IP-Adresse des Raspberry Pi...${RESET}"
IP_ADDRESS=$(hostname -I | awk '{print $1}')
if [[ -n "$IP_ADDRESS" ]]; then
    echo -e "${GREEN}Die aktuelle IP-Adresse des Raspberry Pi ist: $IP_ADDRESS${RESET}"
else
    echo -e "${RED}Warnung: Konnte die IP-Adresse nicht automatisch ermitteln. Bitte überprüfen Sie Ihre Netzwerkeinstellungen.${RESET}"
fi

# SSH-Schlüssel erstellen und übertragen
PRIVATE_KEY_PATH="$HOME/.ssh/raspberry_backup_key"
PUBLIC_KEY_PATH="${PRIVATE_KEY_PATH}.pub"

echo -e "${YELLOW}Erstellen eines SSH-Schlüssels für den Benutzer '${DEFAULT_USER}'...${RESET}"
if [[ -f "$PRIVATE_KEY_PATH" ]]; then
    echo -e "${RED}Der SSH-Schlüssel $PRIVATE_KEY_PATH existiert bereits. Er wird nicht neu erstellt.${RESET}"
else
    ssh-keygen -t rsa -b 4096 -f "$PRIVATE_KEY_PATH" -N "" -q
    echo -e "${GREEN}SSH-Schlüssel wurde erfolgreich erstellt: $PRIVATE_KEY_PATH${RESET}"
fi

echo -e "${YELLOW}Übertragen des öffentlichen Schlüssels auf den Raspberry Pi...${RESET}"
ssh-copy-id -i "$PUBLIC_KEY_PATH" "$DEFAULT_USER@$IP_ADDRESS"
if [[ $? -eq 0 ]]; then
    echo -e "${GREEN}Der öffentliche Schlüssel wurde erfolgreich auf den Raspberry Pi übertragen.${RESET}"
else
    echo -e "${RED}Fehler beim Übertragen des öffentlichen Schlüssels. Bitte überprüfen Sie die Verbindung und die Anmeldedaten.${RESET}" >&2
    exit 1
fi

# Abschlussmeldung
echo -e "${YELLOW}SSH ist jetzt vollständig eingerichtet. Sie können sich verbinden mit:${RESET}"
echo -e "${GREEN}ssh -i $PRIVATE_KEY_PATH $DEFAULT_USER@$IP_ADDRESS${RESET}"
echo "(Falls die IP-Adresse unbekannt ist, prüfen Sie Ihren Router oder verwenden Sie 'arp -a' im Netzwerk.)"
