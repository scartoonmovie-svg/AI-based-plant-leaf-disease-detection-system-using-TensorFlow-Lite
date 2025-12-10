# 🚀 Quick Pi Fix - Run This Now!

## The Problem
- Python 3.13 too new (no tflite-runtime)
- /tmp fills up when compiling
- Code got broken

## The Solution - Use System OpenCV!

Run these commands on your Pi:

```bash
cd ~/AgriGuard
```

```bash
rm -rf venv ~/.cache/pip
```

```bash
python3 -m venv venv --system-site-packages
```

```bash
source venv/bin/activate
```

```bash
pip install --no-cache-dir --upgrade pip
```

```bash
pip install --no-cache-dir flask flask-cors pillow numpy click python-dotenv pyttsx3
```

```bash
python pi_app/main_pi.py --mode web --host 0.0.0.0 --port 5000
```

## All-in-One Command

```bash
cd ~/AgriGuard && rm -rf venv ~/.cache/pip && python3 -m venv venv --system-site-packages && source venv/bin/activate && pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir flask flask-cors pillow numpy click python-dotenv pyttsx3 && python pi_app/main_pi.py --mode web --host 0.0.0.0 --port 5000
```

## What This Does

✅ Uses system `python3-opencv` (already installed - no compilation!)  
✅ Minimal venv (only Flask, etc.)  
✅ UI will work (camera, web interface)  
⚠️ Models won't work yet (need tflite-runtime later)  

## After It Starts

Open browser: **http://192.168.137.182:5000**

You'll see the UI! Camera will work! Models can be added later.

---

**This will work NOW!** 🎉

