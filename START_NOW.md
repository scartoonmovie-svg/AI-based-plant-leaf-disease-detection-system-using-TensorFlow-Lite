# 🚀 START NOW - Client-Server Mode

## This is the EASIEST way! 🎉

---

## On Your Laptop (Windows)

### Step 1: Find Your Laptop IP

```cmd
ipconfig
```

Look for **IPv4 Address** (e.g., `192.168.137.1`)

### Step 2: Start Laptop Server

```cmd
cd C:\ShadowAI\AgriGuard\laptop_server
pip install -r requirements.txt
python server.py
```

You'll see:
```
🌾 AgriGuard Laptop Server
Server starting on http://0.0.0.0:5000
```

---

## On Your Pi

### Step 1: Install Dependencies

```bash
sudo apt-get install python3-picamera2 python3-requests python3-flask
```

### Step 2: Start Pi Client Server

```bash
cd ~/AgriGuard/pi_client
python simple_server.py http://YOUR_LAPTOP_IP:5000
```

Replace `YOUR_LAPTOP_IP` with your actual laptop IP!

You'll see:
```
✅ Camera ready, server reachable at http://YOUR_LAPTOP_IP:5000
Starting Pi client server on port 5001...
```

---

## Open Web Interface

On your laptop browser: **http://localhost:5000**

Click **"Capture & Analyze"** - it uses Pi camera! 🎉

---

## How It Works

1. **You click "Capture & Analyze"** on laptop
2. **Laptop requests Pi** to capture image
3. **Pi captures image** and sends to laptop
4. **Laptop processes** with ML models
5. **Result shown** on web interface

---

## Benefits

✅ **No Python 3.13 issues** - Pi doesn't need ML  
✅ **No space issues** - All on laptop  
✅ **Fast setup** - 5 minutes  
✅ **Easy updates** - Update laptop only  
✅ **Better performance** - Laptop is powerful  

---

## Troubleshooting

**Pi can't reach laptop?**
- Check Windows Firewall (allow port 5000)
- Make sure same WiFi network
- Verify laptop IP is correct

**Camera not working?**
- Enable: `sudo raspi-config` → Interface Options → Camera
- Reboot after enabling

---

**This is the BEST architecture!** 🚀

