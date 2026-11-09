#!/bin/bash

# Set the script to exit immediately if any command fails
set -e

DATE=$(date +%Y-%m-%d)
BACKUP_DIR=/BACKUPS/Vaultwarden
BACKUP_FILE=vaultwarden-$DATE.tar.gz
CONTAINER=Vaultwarden
CONTAINER_DATA_DIR=/SERVICES/VaultWarden/volumes/vaultwarden

# create backups directory if it does not exist
mkdir -p $BACKUP_DIR

# Stop the container
/usr/bin/docker stop $CONTAINER

# Backup the vaultwarden data directory to the backup directory
tar -czf "$BACKUP_DIR/$BACKUP_FILE" -C "$CONTAINER_DATA_DIR" .

# Restart the container
/usr/bin/docker restart $CONTAINER

# To delete files older than 7 days
find $BACKUP_DIR/* -mtime +7 -exec rm {} \;
