#!/bin/bash
# Quick test script for Mac/Linux laptop

echo "========================================"
echo "AgriGuard v1 - Laptop Setup Test"
echo "========================================"
echo ""

echo "Checking Python..."
python3 --version || { echo "ERROR: Python3 not found!"; exit 1; }

echo ""
echo "Installing dependencies..."
pip3 install opencv-python flask flask-cors pyttsx3 numpy pillow python-dotenv click

echo ""
echo "Testing camera..."
python3 run_laptop_demo.py --mode test-camera

echo ""
echo "========================================"
echo "Setup complete!"
echo ""
echo "To run web interface:"
echo "  python3 run_laptop_demo.py --mode web"
echo ""
echo "Then open: http://localhost:5000"
echo "========================================"

