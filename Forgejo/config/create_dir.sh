#!/bin/bash

DIRS=(
"/SERVICES/Forgejo/volumes/data"
"/SERVICES/Forgejo/volumes/postgresql"
)

for dir in "${DIRS[@]}"; do
    mkdir -p "$dir"
    chown opc:opc "$dir"
    # echo "Creada: $dir"
done
