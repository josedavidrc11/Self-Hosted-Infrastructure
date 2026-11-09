#!/bin/bash
set -e

HERMES_DATA="/SERVICES/Hermes/volumes/data"
LOGFILE="/var/log/hermes_clean.log"
CARPETAS=(
  "$HERMES_DATA/cache"
  "$HERMES_DATA/logs"
  "$HERMES_DATA/backups"
  "$HERMES_DATA/image_cache"
  "$HERMES_DATA/audio_cache"
)

CONTENEDOR="${1:-}"

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOGFILE"
}

log "=== Inicio limpieza Hermes ==="
log "Espacio antes: $(du -sh "$HERMES_DATA" | cut -f1)"

for carpeta in "${CARPETAS[@]}"; do
  if [ -d "$carpeta" ]; then
    tam=$(du -sh "$carpeta" | cut -f1)
    rm -rf "${carpeta:?}/"*
    log "Limpiado: $carpeta ($tam)"
  fi
done

log "Espacio después: $(du -sh "$HERMES_DATA" | cut -f1)"

if [ -n "$CONTENEDOR" ]; then
  log "Reiniciando contenedor: $CONTENEDOR"
  docker restart "$CONTENEDOR" >> "$LOGFILE" 2>&1 && log "Contenedor reiniciado" || log "ERROR reiniciando contenedor"
fi

log "=== Fin limpieza Hermes ==="
log ""
