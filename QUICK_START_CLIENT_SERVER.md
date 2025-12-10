# 🚀 Quick Start - Client-Server Mode

## This is the BEST way! 🎉

**Pi = Camera only**  
**Laptop = All processing + Web interface**

---

## Step 1: On Your Laptop

```cmd
cd C:\ShadowAI\AgriGuard\laptop_server
pip install -r requirements.txt
python server.py
```

**Note your laptop IP** (run `ipconfig` and look for IPv4, e.g., `192.168.137.1`)

---

## Step 2: On Your Pi

```bash
cd ~/AgriGuard/pi_client
sudo apt-get install python3-picamera2 python3-requests
python camera_client.py http://YOUR_LAPTOP_IP:5000
```

Replace `YOUR_LAPTOP_IP` with your actual laptop IP!

---

## Step 3: Open Web Interface

On laptop browser: **http://localhost:5000**

Click "Capture & Analyze" - it will use Pi camera! 🎉

---

## Benefits

✅ **No Python 3.13 issues** - Pi doesn't need ML libraries  
✅ **No space issues** - All processing on laptop  
✅ **Fast setup** - Pi only needs camera + network  
✅ **Easy updates** - Update models on laptop only  
✅ **Better performance** - Laptop is faster  

---

## Network Setup

- Laptop and Pi must be on **same WiFi network**
- Find laptop IP: `ipconfig` (Windows) or `ifconfig` (Mac/Linux)
- Pi IP: `192.168.137.182` (your Pi)

---

## Troubleshooting

**Pi can't reach laptop?**
- Check Windows Firewall allows port 5000
- Make sure both on same network
- Verify laptop IP is correct

**Camera not working?**
- Enable camera: `sudo raspi-config` → Interface Options → Camera
- Or use USB camera (change code to use OpenCV)

---

**This is MUCH easier!** 🚀

