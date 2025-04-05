#!/bin/bash

SERVICE_NAME=my_python_service
PYTHON_SCRIPT="/home/febri/PARKEE/hello.py"

# Buat Python Script
echo -e "#!/usr/bin/env python3\nimport time\nwhile True:\n    print('Running...')\n    time.sleep(5)" > "$PYTHON_SCRIPT"
chmod +x "$PYTHON_SCRIPT"

# Buat systemd unit
UNIT_FILE="/etc/systemd/system/${SERVICE_NAME}.service"

sudo bash -c "cat > $UNIT_FILE" <<EOF
[Unit]
Description=Simple Python Service

[Service]
ExecStart=$PYTHON_SCRIPT
Restart=always
User=febriyan

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
echo "✅ Service created. Use: sudo systemctl start $SERVICE_NAME"