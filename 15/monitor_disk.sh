#!/bin/bash

USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')
THRESHOLD=80

if [ "$USAGE" -gt "$THRESHOLD" ]; then
  echo "$(date): Disk usage high: $USAGE%" >> /home/febri/PARKEE/disk_usage.log
  # Contoh notifikasi via wall (broadcast)
  wall "⚠️ Disk usage is above 80%! Current: $USAGE%"
fi