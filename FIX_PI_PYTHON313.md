# 🔧 Fix for Python 3.13 on Pi

## The Problem

Your Pi has Python 3.13, but `tflite-runtime` doesn't support it yet. We need to use full TensorFlow Lite instead.

## Quick Fix Commands

Run these on your Pi:

```bash
cd ~/AgriGuard
source venv/bin/activate

# Install OpenCV first
pip install opencv-python-headless

# Install TensorFlow Lite (full version for Python 3.13)
pip install tensorflow

# Install other dependencies
pip install flask flask-cors pyttsx3 numpy pillow python-dotenv click

# Now try running
python pi_app/main_pi.py --mode web --host 0.0.0.0 --port 5000
```

## Alternative: Use Python 3.11 (Recommended)

If you want lighter weight, install Python 3.11:

```bash
# Install Python 3.11
sudo apt-get install python3.11 python3.11-venv python3.11-pip

# Create new venv with Python 3.11
cd ~/AgriGuard
rm -rf venv
python3.11 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements_pi.txt
```

## What I Fixed

✅ Updated `requirements_pi.txt` to handle Python 3.13
✅ Uses full TensorFlow Lite for Python 3.13+
✅ Falls back to tflite-runtime for older Python versions

