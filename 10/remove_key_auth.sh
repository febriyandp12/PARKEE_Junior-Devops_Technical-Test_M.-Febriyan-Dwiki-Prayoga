#!/bin/bash

UNIQUE_STRING=$1
TARGET_USER=$2

if [ -z "$UNIQUE_STRING" ] || [ -z "$TARGET_USER" ]; then
  echo "Usage: $0 <unique_string> <username>"
  exit 1
fi

USER_HOME=$(eval echo "~$TARGET_USER")
AUTHORIZED_KEYS="$USER_HOME/.ssh/authorized_keys"

if [ ! -f "$AUTHORIZED_KEYS" ]; then
  echo "❌ authorized_keys file not found for $TARGET_USER"
  exit 1
fi

# Buat backup sebelum menghapus
cp "$AUTHORIZED_KEYS" "$AUTHORIZED_KEYS.bak"

# Hapus baris yang mengandung string unik
grep -v "$UNIQUE_STRING" "$AUTHORIZED_KEYS.bak" > "$AUTHORIZED_KEYS"

# Set permission ulang
chown "$TARGET_USER":"$TARGET_USER" "$AUTHORIZED_KEYS"
chmod 600 "$AUTHORIZED_KEYS"

echo "✅ Key(s) containing '$UNIQUE_STRING' removed from $AUTHORIZED_KEYS"