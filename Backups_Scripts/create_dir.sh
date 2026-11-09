#!/bin/bash

DIRS=(
"/BACKUPS/Calibre"
"/BACKUPS/Crafty"
"/BACKUPS/Forgejo"
"/BACKUPS/Mail"
"/BACKUPS/Vaultwarden"
"/BACKUPS/Paperless"
)

for dir in "${DIRS[@]}"; do
    mkdir -p "$dir"
    # echo "Creada: $dir"
done
