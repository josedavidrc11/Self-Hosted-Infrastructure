#!/bin/bash

DIRS=(
"/SERVICES/Nodecast/volumes/data"
)

for dir in "${DIRS[@]}"; do
    mkdir -p "$dir"
    # echo "Creada: $dir"
done
