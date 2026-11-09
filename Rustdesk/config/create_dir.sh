#!/bin/bash

DIRS=(
"/SERVICES/Rustdesk/volumes/api"
"/SERVICES/Rustdesk/volumes/conf"
"/SERVICES/Rustdesk/volumes/data"
)

for dir in "${DIRS[@]}"; do
    mkdir -p "$dir"
    chown opc:opc "$dir"
    # echo "Creada: $dir"
done
