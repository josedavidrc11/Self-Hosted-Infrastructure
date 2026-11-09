#!/bin/bash

DIRS=(
"/SERVICES/Rclone/volumes/config"
"/SERVICES/Rclone/volumes/config_file"
"/SERVICES/Rclone/volumes/database"
)

for dir in "${DIRS[@]}"; do
    mkdir -p "$dir"
    chown opc:opc "$dir"
    # echo "Creada: $dir"
done