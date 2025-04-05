#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DATE=$(date +%Y%m%d_%H%M%S)

if [ -z "$SOURCE_DIR" ] || [ -z "$DEST_DIR" ]; then
  echo "Usage: $0 <source_directory> <destination_directory>"
  exit 1
fi

BACKUP_FILE="${DEST_DIR}/backup_${DATE}.tar.gz"

# Backup
tar -czf "$BACKUP_FILE" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"
echo "Backup berhasil: $BACKUP_FILE"

# Hapus backup lebih dari 7 hari
find "$DEST_DIR" -name "*.tar.gz" -type f -mtime +7 -exec rm -f {} \;
echo "Backup lebih dari 7 hari telah dihapus."