#!/bin/bash

# Flush semua rules lama
sudo iptables -F

# Default: izinkan koneksi keluar
sudo iptables -P OUTPUT ACCEPT
sudo iptables -P INPUT DROP
sudo iptables -P FORWARD DROP

# Izinkan loopback (wajib agar sistem tetap normal)
sudo iptables -A INPUT -i lo -j ACCEPT

# Izinkan koneksi yang sudah established (termasuk SSH yang sedang berjalan!)
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Izinkan SSH, HTTP, HTTPS
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Simpan rules (untuk Ubuntu)
sudo iptables-save | sudo tee /etc/iptables/rules.v4 > /dev/null

echo "✅ Firewall updated dengan aman."