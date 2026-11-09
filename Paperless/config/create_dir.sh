#!/bin/bash

DIRS=(
"/SERVICES/Paperless/volumes/paperless/sql"
"/SERVICES/Paperless/volumes/paperless/redis"
"/SERVICES/Paperless/volumes/paperless/data"
"/SERVICES/Paperless/volumes/paperless/media"
"/SERVICES/Paperless/volumes/paperless/export"
"/SERVICES/Paperless/volumes/paperless/consume"
)

for dir in "${DIRS[@]}"; do
    mkdir -p "$dir"
    # echo "Creada: $dir"
done
