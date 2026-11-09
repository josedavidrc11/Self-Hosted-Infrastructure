#!/bin/bash

DIRS=(
"/SERVICES/Stremio/volumes/data"
)

for dir in "${DIRS[@]}"; do
    mkdir -p "$dir"
    # echo "Creada: $dir"
done
