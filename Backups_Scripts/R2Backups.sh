#!/bin/sh
set -e

R2_BUCKET="r2:clubor-backups"

VOLUMES="Mail Vaultwarden Forgejo Paperless"

for NAME in $VOLUMES; do
  SRC="/BACKUPS/$NAME"
  DEST="r2crypt:/BACKUPS/$NAME"

  echo "Subiendo $NAME desde $SRC a $DEST ..."

  rclone copy "$SRC" "$DEST" \
    --progress \
    --transfers=8 \
    --checkers=16 \
    --log-level INFO

  echo "Limpiando archivos en R2 mayores de 7 días para $NAME ..."

  rclone delete "$DEST" --min-age 7d \
    --log-file="$LOGFILE" \
    --log-level INFO

  echo "Backup y limpieza de $NAME completados"
done

echo "TODOS LOS BACKUPS COMPLETADOS"
