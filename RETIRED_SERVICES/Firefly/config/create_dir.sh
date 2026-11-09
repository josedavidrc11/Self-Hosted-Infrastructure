#!/bin/bash

DIRS=(
"/SERVICES/Firefly/volumes/db_data"
"/SERVICES/Firefly/volumes/uploads"
)

for dir in "${DIRS[@]}"; do
    mkdir -p "$dir"
    # echo "Creada: $dir"
done

