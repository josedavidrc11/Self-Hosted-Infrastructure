#!/bin/bash

DIRS=(
"/SERVICES/Calibre/volumes/calibre/config"
"/SERVICES/Calibre/volumes/calibre/books"
)

for dir in "${DIRS[@]}"; do
    mkdir -p "$dir"
    chown opc:opc "$dir"
    # echo "Creada: $dir"
done

