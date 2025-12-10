#!/bin/bash
# AgriGuard v1 - Raspberry Pi Setup Script

set -e

echo "🌾 AgriGuard v1 - Raspberry Pi Setup"
echo "======================================"

# Check if running on Pi
if [ ! -f /proc/device-tree/model ] || ! grep -q "Raspberry Pi" /proc/device-tree/model; then
    echo "⚠️  Warning: This script is designed for Raspberry Pi"
    read -p "Continue anyway? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Update system
echo "📦 Updating system packages..."
sudo apt-get update
sudo apt-get upgrade -y

# Check for Pi Zero 2W and apply optimizations
IS_ZERO_2W=false
if [ -f /proc/device-tree/model ]; then
    MODEL=$(cat /proc/device-tree/model)
    if echo "$MODEL" | grep -q "Zero 2" || echo "$MODEL" | grep -q "Pi Zero 2"; then
        IS_ZERO_2W=true
        echo "🔧 Detected Raspberry Pi Zero 2W - Applying optimizations..."
        
        # Increase swap for Zero 2W (512MB RAM needs more swap)
        echo "💾 Optimizing swap for Pi Zero 2W..."
        if [ -f /etc/dphys-swapfile ]; then
            sudo dphys-swapfile swapoff 2>/dev/null || true
            sudo sed -i 's/CONF_SWAPSIZE=.*/CONF_SWAPSIZE=512/' /etc/dphys-swapfile 2>/dev/null || true
            sudo dphys-swapfile setup 2>/dev/null || true
            sudo dphys-swapfile swapon 2>/dev/null || true
            echo "✅ Swap increased to 512MB for better performance"
        fi
        
        # Disable unnecessary services to free memory
        echo "🔧 Disabling unnecessary services..."
        sudo systemctl disable bluetooth 2>/dev/null || true
        sudo systemctl stop bluetooth 2>/dev/null || true
        echo "✅ Optimizations applied for Pi Zero 2W"
    fi
fi

# Install system dependencies
echo "📦 Installing system dependencies..."
sudo apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    libcamera-dev \
    libcamera-apps \
    v4l-utils \
    espeak \
    espeak-data \
    libespeak1 \
    libespeak-dev

# Create virtual environment
echo "🐍 Creating Python virtual environment..."
python3 -m venv venv
source venv/bin/activate

# Upgrade pip
pip install --upgrade pip

# Install Python dependencies
echo "📦 Installing Python dependencies..."
pip install -r requirements_pi.txt

# Create necessary directories
echo "📁 Creating directories..."
mkdir -p data/captures
mkdir -p data/processed
mkdir -p logs
mkdir -p models/fruit
mkdir -p models/leaves

# Set permissions
echo "🔐 Setting permissions..."
chmod +x pi_app/main_pi.py

echo ""
echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "  1. Train models on your laptop: python training/train_unified.py --crop tomato --mode fruit"
echo "  2. Copy trained .tflite models to models/ directory"
echo "  3. Run AgriGuard: python pi_app/main_pi.py --mode web"
echo ""
echo "To activate virtual environment: source venv/bin/activate"

