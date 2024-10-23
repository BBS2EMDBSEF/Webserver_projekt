#!/bin/bash

# Pfad zum Verzeichnis, in das das Repository geklont wird
TARGET_DIR="$HOME/Skripts/Systemintegration/Setup/"

# Überprüfen, ob das Verzeichnis schon existiert
if [ -d "$TARGET_DIR" ]; then
    echo "Das Verzeichnis $TARGET_DIR existiert bereits. Kein Klonen erforderlich."
else
    # Klone das GitHub-Repository
    echo "Klone das Repository..."
    git clone https://github.com/BBS2EMDBSEF/Webserver_projekt.git $TARGET_DIR
fi
