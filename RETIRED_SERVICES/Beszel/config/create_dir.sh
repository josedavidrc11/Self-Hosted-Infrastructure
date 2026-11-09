#!/bin/bash

DIRS=(
"/SERVICES/Beszel/volumes/beszel/data"
"/SERVICES/Beszel/volumes/beszel/socket"
"/SERVICES/Beszel/volumes/beszel/agent_data"
)

for dir in "${DIRS[@]}"; do
    mkdir -p "$dir"
    # echo "Creada: $dir"
done