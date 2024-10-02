#!/bin/bash

# Konfiguration
WEB_DIR="/var/www/html"  # Pfad zu deinem Webverzeichnis
BACKUP_DIR="/path/to/backup"  # Pfad zum Backup-Verzeichnis
DB_NAME="deine_datenbank"  # Name der Datenbank
DB_USER="dein_benutzer"  # Datenbankbenutzer
DB_PASS="dein_passwort"  # Datenbankpasswort
DATE=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/backup_$DATE.tar.gz"

# Temporäres Verzeichnis für die Sicherung erstellen
TEMP_DIR=$(mktemp -d)

# Sicherung der Webdateien
cp -r $WEB_DIR/* $TEMP_DIR/

# Sicherung der Datenbank
mysqldump -u $DB_USER -p$DB_PASS $DB_NAME > $TEMP_DIR/db_backup.sql

# Erstellen der tar.gz Datei
tar -czf $BACKUP_FILE -C $TEMP_DIR .

# Temporäres Verzeichnis entfernen
rm -rf $TEMP_DIR

# Optional: Alte Backups löschen (z.B. älter als 7 Tage)
find $BACKUP_DIR -type f -mtime +7 -exec rm {} \;

echo "Backup abgeschlossen und gespeichert in $BACKUP_FILE"