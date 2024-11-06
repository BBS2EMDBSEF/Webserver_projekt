if [ "$EUID" -ne 0 ]; then
  echo "Dieses Skript muss mit Root-Rechten ausgeführt werden. Bitte mit sudo ausführen."
  exit 1
fi

if [ -f /etc/redhat-release ]; then
  yum install -y openssh-server
elif [ -f /etc/debian_version ]; then
  apt-get update
  apt-get install -y openssh-server
else
  echo "Das Skript konnte die Linux-Distribution nicht erkennen und konnte SSH nicht installieren."
  exit 1
fi

systemctl start ssh
systemctl enable ssh

echo "SSH wurde erfolgreich installiert und gestartet."