#!/bin/bash

LOG_FILE="/home/febri/PARKEE/cpu_monitor.log"
THRESHOLD=75

CPU_LOAD=$(awk '{print $1*100}' /proc/loadavg)

if (( $(echo "$CPU_LOAD > $THRESHOLD" | bc -l) )); then
  echo "$(date): CPU Load is high: $CPU_LOAD%" >> "$LOG_FILE"
fi