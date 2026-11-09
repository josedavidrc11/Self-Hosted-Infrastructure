#!/bin/bash

DIRS=(
"/SERVICES/NextCloud/volumes/mysql/data"
"/SERVICES/NextCloud/volumes/nextcloud/config"
"/SERVICES/NextCloud/volumes/nextcloud/data"
"/SERVICES/NextCloud/volumes/nextcloud/user_files"
"/SERVICES/NextCloud/volumes/redis/data"
)

for dir in "${DIRS[@]}"; do
    mkdir -p "$dir"
    # echo "Creada: $dir"
done
