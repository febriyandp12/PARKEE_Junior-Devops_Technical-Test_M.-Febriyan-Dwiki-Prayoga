#!/bin/bash

INTERFACE="ens33"
IP_ADDRESS="192.168.1.100/24"
GATEWAY="192.168.1.1"
DNS1="8.8.8.8"
DNS2="8.8.4.4"
NETPLAN_FILE="/etc/netplan/01-netcfg.yaml"

echo "⚙️  Mengkonfigurasi jaringan menggunakan netplan..."

# Backup konfigurasi lama
sudo cp "$NETPLAN_FILE" "${NETPLAN_FILE}.bak"

# Tulis konfigurasi baru
sudo tee "$NETPLAN_FILE" > /dev/null <<EOF
network:
  version: 2
  renderer: networkd
  ethernets:
    ${INTERFACE}:
      dhcp4: no
      addresses:
        - ${IP_ADDRESS}
      routes:
        - to: default
          via: ${GATEWAY}
      nameservers:
        addresses:
          - ${DNS1}
          - ${DNS2}
EOF

# Set permission aman
sudo chmod 600 "$NETPLAN_FILE"

# Terapkan konfigurasi
sudo netplan apply

echo "✅ Konfigurasi netplan telah diterapkan untuk interface ${INTERFACE}."