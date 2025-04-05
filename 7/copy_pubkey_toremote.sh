#!/bin/bash

PUB_KEY=$1
REMOTE_USER=$2
REMOTE_IP=$3

if [ -z "$PUB_KEY" ] || [ -z "$REMOTE_USER" ] || [ -z "$REMOTE_IP" ]; then
  echo "Usage: $0 <public_key_path> <remote_user> <remote_ip>"
  exit 1
fi

ssh-copy-id -i "$PUB_KEY" "${REMOTE_USER}@${REMOTE_IP}"