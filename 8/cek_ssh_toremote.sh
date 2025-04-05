#!/bin/bash

USER=$1
IP=$2
KEY="/home/febriyan/PARKEE/ssh-keys/id_rsa"

if [ -z "$USER" ] || [ -z "$IP" ]; then
  echo "Usage: $0 <username> <ip_address>"
  exit 1
fi

ssh -i "$KEY" -o BatchMode=yes -o ConnectTimeout=5 "${USER}@${IP}" "exit" 2>/dev/null

if [ $? -eq 0 ]; then
  echo "✅ SSH connection to ${USER}@${IP} SUCCESSFUL"
else
  echo "❌ SSH connection to ${USER}@${IP} FAILED"
fi