#!/bin/bash

ACTION=$1
SERVICE=$2

if [[ -z "$ACTION" || -z "$SERVICE" ]]; then
  echo "Usage: $0 <start|stop|status> <service_name>"
  exit 1
fi

case "$ACTION" in
  start|stop|status)
    sudo systemctl "$ACTION" "$SERVICE"
    ;;
  *)
    echo "Invalid action. Use start, stop, or status."
    ;;
esac