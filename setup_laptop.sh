#!/bin/bash
# AgriGuard v1 - Laptop/Development Setup Script

set -e

echo "🌾 AgriGuard v1 - Development Setup"
echo "===================================="

# Check Python version
python_version=$(python3 --version 2>&1 | awk '{print $2}')
echo "Python version: $python_version"

# Create virtual environment
echo "🐍 Creating Python virtual environment..."
python3 -m venv venv
source venv/bin/activate

# Upgrade pip
pip install --upgrade pip

# Install dependencies
echo "📦 Installing Python dependencies..."
pip install -r requirements.txt

# Create necessary directories
echo "📁 Creating directories..."
mkdir -p data/raw/fruit/{tomato,potato,onion}/{fresh,spoiled}
mkdir -p data/raw/leaves/{tomato,potato}/{healthy,diseased}
mkdir -p data/processed
mkdir -p data/captures
mkdir -p logs
mkdir -p models/fruit
mkdir -p models/leaves

echo ""
echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "  1. Add training images to data/raw/ directories"
echo "  2. Train models: python training/train_unified.py --crop tomato --mode fruit"
echo "  3. Copy .tflite models to Raspberry Pi"
echo ""
echo "To activate virtual environment: source venv/bin/activate"

