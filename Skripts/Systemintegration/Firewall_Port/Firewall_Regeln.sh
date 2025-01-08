#!/bin/bash

echo "========================================="
echo "Firewall einstellen"
echo "========================================="

# Aktiviert die Firewall
sudo ufw enable

# Standardmäßig alle eingehenden Verbindungen blockieren
sudo ufw default deny incoming

# Standardmäßig alle ausgehenden Verbindungen blockieren
sudo ufw default deny outgoing

# Ermöglicht den SSH-Zugang (Port 22)
sudo ufw allow ssh

# Ermöglicht den MySQL-Zugang (Port 3306) - nur zulassen, wenn du MySQL von extern erreichen möchtest
sudo ufw allow mysql

# Falls du den Zugriff auf MySQL nur von bestimmten IP-Adressen oder Netzwerken zulassen möchtest, verwende:
# sudo ufw allow from <IP-Adresse> to any port 3306

# Ermöglicht Webserver-Verkehr (Port 80 für HTTP und Port 443 für HTTPS)
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp

# Optional: Wenn du andere Dienste verwenden möchtest, füge diese hier hinzu (z. B. FTP, DNS)
# sudo ufw allow 21/tcp  # FTP
# sudo ufw allow 53/tcp  # DNS

# Zeige die aktuellen Regeln an
echo "Aktuelle UFW-Regeln:"
sudo ufw status verbose
