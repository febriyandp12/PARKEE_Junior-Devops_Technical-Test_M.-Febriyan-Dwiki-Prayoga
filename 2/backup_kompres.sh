#!/bin/bash

SOURCE_DIR=$1
DESTINATION=$2
DATE=$(date +%Y%m%d_%H%M%S)

if [ -z "$SOURCE_DIR" ] || [ -z "$DESTINATION" ]; then
  echo "Usage: $0 <source_directory> <destination_path>"
  exit 1
fi

BACKUP_NAME="backup_${DATE}.tar.gz"
tar -czf "${DESTINATION}/${BACKUP_NAME}" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"

echo "Backup selesai: ${DESTINATION}/${BACKUP_NAME}"