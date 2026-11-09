#!/bin/bash
set -e

# --- CONFIGURACIÓN ---
# Carpeta donde tienes instalado paperless (donde está el docker-compose.yml)
DOCKER_DIR="/SERVICES/Paperless/volumes/paperless"
# Carpeta donde quieres guardar los backups comprimidos
BACKUP_DEST="/BACKUPS/Paperless"
# Nombre del contenedor de Paperless
CONTAINER_NAME="Paperless"
# Fecha para el nombre del archivo
DATE=$(date +%Y-%m-%d_%H-%M)

KEEP_DAYS=3

echo "Iniciando exportación de Paperless-ngx..."

# 2. Ejecutar el exportador nativo de Paperless
docker exec $CONTAINER_NAME python3 manage.py document_exporter ../export/

# 3. Comprimir la carpeta de exportación
echo "Comprimiendo archivos en $DATE.tar.gz..."
tar -czf "$BACKUP_DEST/paperless_backup_$DATE.tar.gz" -C "$DOCKER_DIR/export" .

# 4. Limpieza
echo "Limpiando archivos temporales..."

rm -rf "$DOCKER_DIR/export/"* echo "Copia de seguridad completada con éxito en: $BACKUP_DEST/paperless_backup_$DATE.tar.gz"

# Limpiar backups antiguos (carpetas completas)
echo "Limpiando backups antiguos..."
find "$BACKUP_DEST" -maxdepth 1 -type f -name "paperless*" -mtime +$KEEP_DAYS -delete;

echo "Backup Paperless completado"
