#!/bin/bash

DIRS=(
"/SERVICES/Crafty/volumes/config"
"/SERVICES/Crafty/volumes/import"
"/SERVICES/Crafty/volumes/servers"
"/SERVICES/Crafty/volumes/backups"
"/SERVICES/Crafty/volumes/logs"
)

for dir in "${DIRS[@]}"; do
    mkdir -p "$dir"
    chown opc:opc "$dir"
    # echo "Creada: $dir"

done
