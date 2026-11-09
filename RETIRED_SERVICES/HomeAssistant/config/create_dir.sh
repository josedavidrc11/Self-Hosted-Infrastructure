#!/bin/bash

DIRS=(
"/SERVICES/HomeAssistant/volumes/ha/config"
)

for dir in "${DIRS[@]}"; do
    mkdir -p "$dir"
    # echo "Creada: $dir"
done