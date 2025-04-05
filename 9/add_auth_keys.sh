#!/bin/bash

PUBKEY_FILE=$1
TARGET_USER=$2

if [ -z "$PUBKEY_FILE" ] || [ -z "$TARGET_USER" ]; then
  echo "Usage: $0 <public_key_file> <username>"
  exit 1
fi

# Path ke home user target
USER_HOME=$(eval echo "~$TARGET_USER")
SSH_DIR="$USER_HOME/.ssh"
AUTHORIZED_KEYS="$SSH_DIR/authorized_keys"

# Buat folder .ssh jika belum ada
if [ ! -d "$SSH_DIR" ]; then
  mkdir -p "$SSH_DIR"
  chown "$TARGET_USER":"$TARGET_USER" "$SSH_DIR"
  chmod 700 "$SSH_DIR"
fi

# Tambahkan key ke authorized_keys jika belum ada
grep -q -f "$PUBKEY_FILE" "$AUTHORIZED_KEYS" 2>/dev/null || cat "$PUBKEY_FILE" >> "$AUTHORIZED_KEYS"

# Set permission dan ownership
chown "$TARGET_USER":"$TARGET_USER" "$AUTHORIZED_KEYS"
chmod 600 "$AUTHORIZED_KEYS"

echo "✅ Public key added to $AUTHORIZED_KEYS"