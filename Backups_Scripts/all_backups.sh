#!/bin/bash

# Detener el script si ocurre un error
set -e

# Variable para logs
LOG_FILE="/var/log/backup_general.log"

echo "--- Inicio de Backup: $(date) ---" | tee -a "$LOG_FILE"

# 1. Mailcow
export MAILCOW_BACKUP_LOCATION="/BACKUPS/Mail/"
if /SERVICES/Mail/helper-scripts/backup_and_restore.sh backup all --delete-days 7 >> "$LOG_FILE" 2>&1; then
    echo "[OK] Copia de Mailcow realizada"
else
    echo "[ERROR] Falló copia de Mailcow" >&2
fi

# 2. Otros servicios (Agrupados para limpieza)
servicios="VaultWarden Forgejo Paperless"

for servicio in $servicios; do
    SCRIPT_PATH="/SERVICES/$servicio/config/backup.sh"
    if [ -f "$SCRIPT_PATH" ]; then        
        chmod 755 "$SCRIPT_PATH"

        if "$SCRIPT_PATH" >> "$LOG_FILE" 2>&1; then
            echo "[OK] Copia de $servicio realizada"
        else
            echo "[ERROR] Falló copia de $servicio (revisa el log: $LOG_FILE)" >&2
        fi
    else
        echo "[SALTADO] No se encontró script en $SCRIPT_PATH"
    fi
done

# 3. Subida a Cloudflare R2
echo "Iniciando sincronización con R2..."
if /SERVICES/Backups_Scripts/R2Backups.sh >> "$LOG_FILE" 2>&1; then
    echo "[OK] Copias guardadas en el bucket"
else
    echo "[ERROR] Falló la sincronización con Rclone" >&2
    exit 1
fi

echo "--- Fin de Backup: $(date) ---" | tee -a "$LOG_FILE"
