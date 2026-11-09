#!/bin/bash

DIRS=(
"/SERVICES/StirlingPDF/volumes/stirling/trainingData"
"/SERVICES/StirlingPDF/volumes/stirling/extraGlobalFiles"
"/SERVICES/StirlingPDF/volumes/stirling/logs"
"/SERVICES/StirlingPDF/volumes/stirling/configs"
)

for dir in "${DIRS[@]}"; do
    mkdir -p "$dir"
    chown opc:opc "$dir"
    # echo "Creada: $dir"
done

