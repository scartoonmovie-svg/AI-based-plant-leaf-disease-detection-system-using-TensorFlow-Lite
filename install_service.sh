#!/bin/bash
# Install AgriGuard as a systemd service

set -e

echo "🔧 Installing AgriGuard systemd service..."

# Get the absolute path of AgriGuard directory
AGRIGUARD_DIR=$(cd "$(dirname "$0")" && pwd)
SERVICE_FILE="$AGRIGUARD_DIR/agriguard.service"

# Update service file with correct paths
sed -i "s|/home/pi/AgriGuard|$AGRIGUARD_DIR|g" "$SERVICE_FILE"

# Copy service file
sudo cp "$SERVICE_FILE" /etc/systemd/system/

# Reload systemd
sudo systemctl daemon-reload

# Enable service
sudo systemctl enable agriguard.service

echo "✅ Service installed!"
echo ""
echo "Commands:"
echo "  Start:   sudo systemctl start agriguard"
echo "  Stop:    sudo systemctl stop agriguard"
echo "  Status:  sudo systemctl status agriguard"
echo "  Logs:    sudo journalctl -u agriguard -f"

