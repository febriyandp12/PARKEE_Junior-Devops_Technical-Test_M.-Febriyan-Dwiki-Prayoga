#!/bin/bash

LOGFILE="/var/log/system_update.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

echo "[$DATE] Memulai update sistem..." >> $LOGFILE
sudo apt update && sudo apt upgrade -y >> $LOGFILE 2>&1

if [ $? -eq 0 ]; then
  echo "[$DATE] Update selesai." >> $LOGFILE
else
  echo "[$DATE] Update GAGAL." >> $LOGFILE
fi