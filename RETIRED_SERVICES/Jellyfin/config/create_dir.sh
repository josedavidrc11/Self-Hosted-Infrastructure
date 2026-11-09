#!/bin/bash

DIRS=(
"/SERVICES/Jellyfin/volumes/jellyfin/config"
"/SERVICES/Jellyfin/volumes/radarr/config"
"/SERVICES/Jellyfin/volumes/sonarr/config"
"/SERVICES/Jellyfin/volumes/qbit/config"
"/SERVICES/Jellyfin/volumes/prowlarr/config"
"/SERVICES/Jellyfin/volumes/jellyseerr/config"
"/SERVICES/Jellyfin/volumes/media/movies_download"
"/SERVICES/Jellyfin/volumes/media/series_download"
"/SERVICES/Jellyfin/volumes/downloads"
"/SERVICES/Jellyfin/volumes/flaresolverr/config"
"/SERVICES/Jellyfin/volumes/dispatcharr/data"
)

for dir in "${DIRS[@]}"; do
    mkdir -p "$dir"
    # echo "Creada: $dir"
done