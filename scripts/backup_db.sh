#!/bin/bash

DB_NAME="proyecto_so"
DB_USER="root"
BACKUP_DIR="/home/linux/backups"
FECHA=$(date +%Y-%m-%d_%H-%M)
ARCHIVO="backup_db_${FECHA}.sql"

if [ ! -d "$BACKUP_DIR" ]; then
  mkdir -p "$BACKUP_DIR"
  echo "Carpeta $BACKUP_DIR creada."
fi

mysqldump -u backupuser -p'linux' "$DB_NAME" > "$BACKUP_DIR/$ARCHIVO"

if [ $? -eq 0 ]; then
  gzip "$BACKUP_DIR/$ARCHIVO"
  echo "$(date '+%Y-%m-%d %H:%M:%S') - Backup exitoso: ${ARCHIVO}.gz" >> "$BACKUP_DIR/backup.log"
else
  echo "$(date '+%Y-%m-%d %H:%M:%S') - ERROR: fallo al respaldar la base de datos" >> "$BACKUP_DIR/backup.log"
fi
