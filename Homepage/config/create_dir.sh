#!/bin/bash

DIRS=(
"/SERVICES/Homepage/volumes/homepage"
"/SERVICES/Homepage/volumes/homepage/public/images"
"/SERVICES/Homepage/volumes/homepage/public/icons"
)

for dir in "${DIRS[@]}"; do
    mkdir -p "$dir"
    # echo "Creada: $dir"
done
