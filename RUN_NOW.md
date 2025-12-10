# 🚀 RUN NOW - Exact Commands

## Your Setup
- **Laptop IP**: `192.168.137.1`
- **Pi IP**: `192.168.137.182`

---

## Step 1: On Laptop (Windows)

```cmd
cd C:\ShadowAI\AgriGuard\laptop_server
python server.py
```

You'll see:
```
🌾 AgriGuard Laptop Server
Server starting on http://0.0.0.0:5000
```

**Keep this terminal open!**

---

## Step 2: On Pi (SSH)

```bash
cd ~/AgriGuard/pi_client
sudo apt-get install python3-picamera2 python3-requests python3-flask
python simple_server.py
```

The default laptop IP (192.168.137.1) is already set!

You'll see:
```
✅ Camera ready, server reachable at http://192.168.137.1:5000
Starting Pi client server on port 5001...
```

**Keep this terminal open!**

---

## Step 3: Open Web Interface

On your laptop browser: **http://localhost:5000**

Click **"Capture & Analyze"** - it will use Pi camera! 🎉

---

## Fix Numpy Version (Optional)

If you see numpy warnings, fix it:

```cmd
pip install "numpy>=1.25.0,<2.0.0"
```

---

## Test Connection

### From Laptop
```cmd
curl http://192.168.137.182:5001/health
```

Should return: `{"status":"ok",...}`

### From Pi
```bash
curl http://192.168.137.1:5000/api/health
```

Should return: `{"status":"ok",...}`

---

## Troubleshooting

**Pi can't reach laptop?**
- Check Windows Firewall: Allow port 5000
- Make sure both on same WiFi
- Test: `ping 192.168.137.1` from Pi

**Camera not working?**
- Enable: `sudo raspi-config` → Interface Options → Camera
- Reboot after enabling

---

**Everything is ready! Just run the commands above!** 🚀

