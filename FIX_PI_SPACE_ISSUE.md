# 🔧 Fix Pi Space Issue

## The Problem

1. `/tmp` directory is full (182M tmpfs) - pip tries to compile OpenCV from source
2. TensorFlow not available for Python 3.13 on ARM

## Solution: Clean Space & Use Pre-built Wheels

Run these commands on your Pi:

### Step 1: Clean up space

```bash
# Clean pip cache
pip cache purge

# Clean temporary files
sudo rm -rf /tmp/*
sudo rm -rf ~/.cache/pip

# Check space
df -h
```

### Step 2: Install OpenCV from pre-built wheel (faster, less space)

```bash
cd ~/AgriGuard
source venv/bin/activate

# Install OpenCV from piwheels (pre-built for Pi)
pip install --only-binary :all: opencv-python-headless

# If that doesn't work, try:
pip install opencv-python-headless --no-cache-dir
```

### Step 3: Install TensorFlow Lite (lightweight alternative)

Since TensorFlow full version isn't available for Python 3.13 ARM, we'll use a workaround:

```bash
# Install TensorFlow Lite via pip (if available)
pip install tensorflow-lite

# OR install from source (lighter)
pip install --no-cache-dir tensorflow-lite
```

### Step 4: If still no space, use system Python packages

```bash
# Exit venv
deactivate

# Install system packages
sudo apt-get install python3-opencv python3-numpy python3-pil

# Then create minimal venv
python3 -m venv venv --system-site-packages
source venv/bin/activate
pip install flask flask-cors pyttsx3 python-dotenv click
```

## Alternative: Use Python 3.11 (Best Solution)

Python 3.11 has all packages available:

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

This will work perfectly! ✅

