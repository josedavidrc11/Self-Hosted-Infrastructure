#!/bin/bash

DIRS=(
"/SERVICES/Hermes/volumes/data"
)

for dir in "${DIRS[@]}"; do
    mkdir -p "$dir"
    chown opc:opc "$dir"
    # echo "Creada: $dir"
done

