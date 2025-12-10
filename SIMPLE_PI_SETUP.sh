#!/bin/bash
# Simple Pi Setup - Uses system OpenCV, minimal dependencies

echo "🌾 AgriGuard - Simple Pi Setup"
echo "================================"

# Step 1: Install system OpenCV (if not already)
echo "📦 Installing system packages..."
sudo apt-get update
sudo apt-get install -y python3-opencv libcamera-apps ffmpeg espeak espeak-data

# Step 2: Clean up
echo "🧹 Cleaning up..."
rm -rf ~/AgriGuard/venv ~/.cache/pip

# Step 3: Create venv with system site-packages (to use system opencv)
echo "🐍 Creating virtual environment..."
cd ~/AgriGuard
python3 -m venv venv --system-site-packages
source venv/bin/activate

# Step 4: Install minimal dependencies
echo "📦 Installing Python packages..."
pip install --no-cache-dir --upgrade pip
pip install --no-cache-dir flask flask-cors pillow numpy click python-dotenv pyttsx3

# Step 5: Test
echo "✅ Testing..."
python3 -c "import cv2; print('✅ OpenCV:', cv2.__version__)" || echo "❌ OpenCV not found"
python3 -c "import flask; print('✅ Flask ready')" || echo "❌ Flask not found"

echo ""
echo "✅ Setup complete!"
echo ""
echo "To run:"
echo "  cd ~/AgriGuard"
echo "  source venv/bin/activate"
echo "  python pi_app/main_pi.py --mode web --host 0.0.0.0 --port 5000"
echo ""
echo "Note: Models won't work without tflite-runtime, but UI will run!"

