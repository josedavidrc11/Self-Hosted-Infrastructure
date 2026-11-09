#!/bin/bash

DIRS=(
"/SERVICES/GitLab/volumes/gitlab/config"
"/SERVICES/GitLab/volumes/gitlab/logs"
"/SERVICES/GitLab/volumes/gitlab/data"
)

for dir in "${DIRS[@]}"; do
    mkdir -p "$dir"
    # echo "Creada: $dir"
done