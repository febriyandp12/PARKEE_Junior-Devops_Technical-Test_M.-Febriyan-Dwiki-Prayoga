#!/bin/bash

TARGET_DIR=$1

if [ -z "$TARGET_DIR" ]; then
  echo "Usage: $0 <target_directory>"
  exit 1
fi

mkdir -p "$TARGET_DIR"

KEY_PATH="$TARGET_DIR/id_rsa"

ssh-keygen -t rsa -b 4096 -f "$KEY_PATH" -N "" <<< y

echo "SSH key pair berhasil dibuat di $KEY_PATH"