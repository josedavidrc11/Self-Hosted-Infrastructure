#!/bin/bash

DIRS=(
"/SERVICES/VaultWarden/volumes/vaultwarden/data"
)

for dir in "${DIRS[@]}"; do
    mkdir -p "$dir"
    # echo "Creada: $dir"
done
