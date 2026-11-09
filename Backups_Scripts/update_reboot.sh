#!/bin/bash

set -e

rm -rf /SERVICES/Stremio/volumes/data/stremio-cache

echo "==== Limpiando peliculas y series de Jellyfin ===="
#find /SERVICES/Jellyfin/volumes/media/movies/ -type f -mtime +15 -delete
#find /SERVICES/Jellyfin/volumes/media/movies/ -type d -empty -delete
#find /SERVICES/Jellyfin/volumes/media/tv/ -type f -mtime +15 -delete
#find /SERVICES/Jellyfin/volumes/media/tv/ -type d -empty -delete
#find /SERVICES/Jellyfin/volumes/media/downloads/ -type f -mtime +15 -delete
#find /SERVICES/Jellyfin/volumes/media/downloads/ -type d -empty -delete

#find /SERVICES/Jellyfin/volumes/downloads/ -type f -mtime +5 -delete

#mkdir -p /SERVICES/Jellyfin/volumes/media/movies/
#mkdir -p /SERVICES/Jellyfin/volumes/media/tv/
#mkdir -p /SERVICES/Jellyfin/volumes/media/downloads/

#chown opc:opc /SERVICES/Jellyfin/volumes/media/movies/
#chown opc:opc /SERVICES/Jellyfin/volumes/media/tv/
#chown opc:opc /SERVICES/Jellyfin/volumes/media/downloads/


echo "==== Actualizando repositorios y paquetes del sistema ===="
sudo apt update && sudo apt upgrade -y

echo "==== Actualizando Servidor Mail ===="
cd /SERVICES/Mail/ && yes y | ./update.sh

echo "==== Limpiando paquetes innecesarios ===="
sudo apt autoremove -y
sudo apt autoclean -y

echo "==== Limpiando Docker ===="
sudo docker system prune -a -f --volumes

echo "==== Limpiado logs del sistema ===="
sudo journalctl --vacuum-time=1s

echo "==== Reiniciando el sistema ===="
sudo reboot
