#!/bin/bash

echo "========================================="
echo "Gesamtes Setup-Skript"
echo "========================================="

# SSH einrichten
echo "SSH wird eingerichtet..."
bash ssh_config.sh

# MySQL einrichten
echo "MySQL wird eingerichtet..."
bash mysql_config.sh

# PHP einrichten
echo "PHP wird eingerichtet..."
bash php_config.sh

# Apache einrichten
echo "Apache wird eingerichtet..."
bash apache_config.sh

# Backup-Skript prüfen
BACKUP_SCRIPT="/path/to/backup_to_github.sh" # Pfad zu deinem Backup-Skript
CRON_JOB="0 0 * * * /bin/bash $BACKUP_SCRIPT >> /path/to/backup.log 2>&1"

echo "Backup-Skript wird überprüft..."
if [ -f "$BACKUP_SCRIPT" ]; then
    echo "Backup-Skript gefunden. Richte Cronjob ein..."
    
    # Bestehende Cronjobs sichern
    crontab -l > mycron || echo "" > mycron
    
    # Cronjob hinzufügen, falls nicht vorhanden
    if ! grep -q "$BACKUP_SCRIPT" mycron; then
        echo "$CRON_JOB" >> mycron
        crontab mycron
        echo "Cronjob für Backup eingerichtet."
    else
        echo "Cronjob für Backup existiert bereits."
    fi

    # Temporäre Datei löschen
    rm -f mycron
else
    echo "Backup-Skript nicht gefunden. Bitte sicherstellen, dass $BACKUP_SCRIPT existiert."
fi

echo "========================================="
echo "Setup abgeschlossen! Alle Dienste sind installiert."
echo "========================================="
