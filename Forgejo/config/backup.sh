#!/bin/bash
set -e

CONTAINER="Forgejo"
BACKUP_DIR_INTERNAL="/data/backups" 
BACKUP_DIR_HOST="/SERVICES/Forgejo/volumes/data/backups" 
DEST_DIR="/BACKUPS/Forgejo"
KEEP_DAYS=2
DATE=$(date +%F_%H-%M)

echo "===== Iniciando backup Forgejo $DATE ====="

mkdir -p "$BACKUP_DIR_HOST"
mkdir -p "$DEST_DIR"

echo "Ejecutando forgejo dump..."
docker exec -u 1000 -t $CONTAINER sh -c "cd /data && forgejo dump -c /data/gitea/conf/app.ini"

echo "Organizando archivos de backup..."
mkdir -p "$DEST_DIR/forgejo_$DATE"

if [ "$(ls -A $BACKUP_DIR_HOST/*.zip 2>/dev/null)" ]; then
    mv $BACKUP_DIR_HOST/*.zip "$DEST_DIR/forgejo_$DATE/"
    echo "Archivo movido con éxito a $DEST_DIR/forgejo_$DATE"
else

    if [ "$(ls -A /SERVICES/Forgejo/volumes/data/*.zip 2>/dev/null)" ]; then
        mv /SERVICES/Forgejo/volumes/data/*.zip "$DEST_DIR/forgejo_$DATE/"
        echo "Archivo movido desde raíz de volumen a $DEST_DIR/forgejo_$DATE"
    else
        echo "Error: No se encontró el archivo .zip generado."
        exit 1
    fi
fi


echo "Limpiando backups con más de $KEEP_DAYS días..."
find "$DEST_DIR" -type d -mtime +$KEEP_DAYS -exec rm -rf {} + 2>/dev/null || true

echo "Backup Forgejo COMPLETO finalizado"
