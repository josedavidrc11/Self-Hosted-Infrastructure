#!/bin/bash

DIRS=(
"/SERVICES/Netbird/volumes/data"
"/SERVICES/Netbird/volumes/client_data"
)

for dir in "${DIRS[@]}"; do
    mkdir -p "$dir"
    chown opc:opc "$dir"
    # echo "Creada: $dir"
done
