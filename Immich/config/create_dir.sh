#!/bin/bash

DIRS=(
"/SERVICES/Immich/volumes/immich/postgres"
"/SERVICES/Immich/volumes/immich/upload"
"/SERVICES/Immich/volumes/immich/library"
"/SERVICES/Immich/volumes/redis/dataimmich"
)

for dir in "${DIRS[@]}"; do
    mkdir -p "$dir"
    # echo "Creada: $dir"
done
