#!/bin/bash

# Variablen
GIT_REPO="git@github.com:<USERNAME>/backup-repo.git"
CLONE_DIR="/path/to/backup-clone"
ARCHIVE_NAME="repository_backup_$(date +'%Y-%m-%d_%H-%M-%S').tar.gz"

echo "========================================="
echo "Backup des gesamten Repositorys gestartet"
echo "========================================="

# Repository klonen
echo "Klonen des Repositorys..."
rm -rf "$CLONE_DIR"
git clone --mirror "$GIT_REPO" "$CLONE_DIR"

# Repository als Archiv speichern
echo "Erstelle ein Archiv des geklonten Repositorys..."
tar -czf "$ARCHIVE_NAME" -C "$(dirname "$CLONE_DIR")" "$(basename "$CLONE_DIR")"

# Archiv speichern
echo "Archiv gespeichert unter $ARCHIVE_NAME."

echo "========================================="
echo "Repository-Backup abgeschlossen!"
echo "========================================="
