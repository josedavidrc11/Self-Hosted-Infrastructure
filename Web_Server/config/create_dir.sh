#!/bin/bash

DIRS=(
"/SERVICES/Web_Server/volumes/ddclient/config"
"/SERVICES/Web_Server/volumes/webserver/config"
)

for dir in "${DIRS[@]}"; do
    mkdir -p "$dir"
    # echo "Creada: $dir"
done
