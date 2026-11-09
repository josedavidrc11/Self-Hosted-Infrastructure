#!/bin/bash

DIRS=(
"/SERVICES/Komodo/volumes/backups"
"/SERVICES/Komodo/volumes/komodo/mongo/data"
"/SERVICES/Komodo/volumes/komodo/mongo/config"
"/SERVICES/Komodo/volumes/komodo/syncs"
"/SERVICES/Komodo/volumes/periphery"
)

for dir in "${DIRS[@]}"; do
    mkdir -p "$dir"
    # echo "Creada: $dir"
done