#!/bin/bash
set -e

# CONFIG (Añadidas las barras "/" iniciales)
CONTAINER="GitLab"
BACKUP_DIR="/var/opt/gitlab/backups"
BACKUP_DIR2="/BACKUPS/GitLab"
BACKUP_DIR3="/SERVICES/GitLab/volumes/gitlab/data/backups"
KEEP_DAYS=5
DATE=$(date +%F)

echo "===== Iniciando backup GitLab $DATE ====="

# 1. Backup oficial GitLab
echo "Ejecutando gitlab-backup create..."
docker exec -t $CONTAINER gitlab-backup create

# 2. Backup de secretos y config (Corregido el comando tar)
echo "Copiando etc/gitlab..."
docker exec $CONTAINER tar czf "$BACKUP_DIR/gitlab-secrets_$DATE.tar.gz" /etc/gitlab

# 3. Ajustar permisos
docker exec $CONTAINER chown git:git "$BACKUP_DIR/gitlab-secrets_$DATE.tar.gz"

# 4. Limpiar backups antiguos
echo "Limpiando backups con más de $KEEP_DAYS días..."
find "$BACKUP_DIR2" -type f -mtime +$KEEP_DAYS -delete 2>/dev/null || true

# 5. Organizar archivos
mkdir -p "$BACKUP_DIR2/gitlab_$DATE"

# Cambiamos a la carpeta de origen
if cd "$BACKUP_DIR3"; then
    # Verificamos si hay archivos (ls -A evita errores si está vacío)
    if [ "$(ls -A)" ]; then
        echo "Moviendo archivos a $BACKUP_DIR2/gitlab_$DATE"
        mv * "$BACKUP_DIR2/gitlab_$DATE/"
    else
        echo "No se encontraron archivos para mover en $BACKUP_DIR3"
    fi
else
    echo "Error: No se pudo acceder a $BACKUP_DIR3"
    exit 1
fi

echo "Backup GitLab COMPLETO finalizado"
