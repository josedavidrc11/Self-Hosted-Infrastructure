#!/bin/bash

DIRS=(
"/SERVICES/Dispatcharr/volumes/data"
)

for dir in "${DIRS[@]}"; do
    mkdir -p "$dir"
    # echo "Creada: $dir"
done
