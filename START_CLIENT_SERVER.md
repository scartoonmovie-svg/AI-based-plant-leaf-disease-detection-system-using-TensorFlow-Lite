# 🚀 Start Client-Server System

## Quick Start

### Step 1: On Laptop (Start Server)

```bash
cd C:\ShadowAI\AgriGuard\laptop_server
python server.py
```

**Note your laptop IP** (shown in terminal or run `ipconfig` on Windows)

### Step 2: On Pi (Start Client)

```bash
cd ~/AgriGuard/pi_client
python camera_client.py http://YOUR_LAPTOP_IP:5000
```

Replace `YOUR_LAPTOP_IP` with your actual laptop IP (e.g., `192.168.137.1`)

### Step 3: Open Web Interface

On laptop browser: **http://localhost:5000**

---

## What You Need

### Laptop
- ✅ Python 3.8+
- ✅ All ML libraries (TensorFlow, OpenCV, etc.)
- ✅ Trained models

### Pi
- ✅ Python 3
- ✅ Camera (Pi Camera or USB)
- ✅ Network connection
- ✅ `picamera2` OR `opencv-python` (for camera)
- ✅ `requests` library

---

## Install Pi Dependencies

```bash
# On Pi
sudo apt-get install python3-picamera2 python3-requests
# OR for USB camera:
sudo apt-get install python3-opencv python3-requests
```

---

## Test Connection

### On Laptop
```bash
# Check if server is running
curl http://localhost:5000/api/health
```

### On Pi
```bash
# Test if can reach laptop
python camera_client.py http://YOUR_LAPTOP_IP:5000
```

---

## Troubleshooting

### Pi can't reach laptop
- Check firewall on laptop
- Make sure both on same network
- Verify laptop IP address

### Camera not working on Pi
- Check camera is enabled: `sudo raspi-config`
- Try USB camera instead
- Check permissions

---

**This is the BEST way!** 🎉

