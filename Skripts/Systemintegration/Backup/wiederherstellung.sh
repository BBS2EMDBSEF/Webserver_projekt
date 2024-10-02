#!/bin/bash

# Konfiguration
BACKUP_DIR="/path/to/backup"  # Pfad zum Backup-Verzeichnis
WEB_DIR="/var/www/html"  # Pfad zu deinem Webverzeichnis
DB_NAME="deine_datenbank"  # Name der Datenbank
DB_USER="dein_benutzer"  # Datenbankbenutzer
DB_PASS="dein_passwort"  # Datenbankpasswort

# Finde die neueste Backup-Datei
BACKUP_FILE=$(ls -t $BACKUP_DIR/*.tar.gz 2>/dev/null | head -n 1)

# Überprüfen, ob eine Backup-Datei gefunden wurde
if [ -z "$BACKUP_FILE" ]; then
    echo "Keine Backup-Datei im Verzeichnis $BACKUP_DIR gefunden."
    exit 1
fi

echo "Wiederherstellung von Backup-Datei: $BACKUP_FILE"

# Temporäres Verzeichnis für die Wiederherstellung erstellen
TEMP_DIR=$(mktemp -d)

# Backup-Datei entpacken
tar -xzf $BACKUP_FILE -C $TEMP_DIR

# Wiederherstellung der Webdateien
cp -r $TEMP_DIR/* $WEB_DIR/

# Wiederherstellung der Datenbank
if [ -f "$TEMP_DIR/db_backup.sql" ]; then
    mysql -u $DB_USER -p$DB_PASS $DB_NAME < $TEMP_DIR/db_backup.sql
else
    echo "Datenbank-Backup-Datei nicht gefunden."
fi

# Temporäres Verzeichnis entfernen
rm -rf $TEMP_DIR

echo "Wiederherstellung abgeschlossen."