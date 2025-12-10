# 🏗️ Client-Server Architecture

## New Architecture (Better!)

### **Pi (Client)**
- ✅ Only captures images
- ✅ Sends to laptop via network
- ✅ Lightweight (no ML libraries needed!)
- ✅ Fast setup

### **Laptop (Server)**
- ✅ All ML processing
- ✅ Web interface
- ✅ Database
- ✅ Full control

### **Benefits**
- ✅ No Python 3.13 issues on Pi
- ✅ No space constraints
- ✅ Faster processing (laptop is powerful)
- ✅ Easy to update models
- ✅ Pi can be headless

---

## Setup

### On Laptop

1. **Start server:**
```bash
cd AgriGuard/laptop_server
python server.py
```

2. **Find your laptop IP:**
```bash
# Windows
ipconfig
# Look for IPv4 Address (e.g., 192.168.137.1)

# Mac/Linux
ifconfig
# Look for inet address
```

3. **Update Pi client with laptop IP**

### On Pi

1. **Install minimal dependencies:**
```bash
sudo apt-get install python3-picamera2 python3-requests
# OR if using USB camera:
sudo apt-get install python3-opencv python3-requests
```

2. **Run Pi client:**
```bash
cd ~/AgriGuard/pi_client
python camera_client.py http://YOUR_LAPTOP_IP:5000
```

---

## How It Works

1. **User opens web interface** on laptop: `http://localhost:5000`
2. **User clicks "Capture & Analyze"**
3. **Laptop sends request to Pi** to capture image
4. **Pi captures image** and sends back to laptop
5. **Laptop processes image** with ML models
6. **Laptop shows result** on web interface

---

## Network Setup

- **Laptop and Pi must be on same network**
- **Laptop IP**: Find with `ipconfig` (Windows) or `ifconfig` (Mac/Linux)
- **Pi IP**: Your Pi's IP (192.168.137.182)
- **Port**: 5000 (default)

---

## Advantages

| Feature | Old (All on Pi) | New (Client-Server) |
|---------|----------------|---------------------|
| Setup Time | 30+ min | 5 min |
| Dependencies | Heavy | Light |
| Performance | Slow | Fast |
| Updates | Hard | Easy |
| Space | Limited | Unlimited |
| Python Version | Must match | Any |

---

**This is MUCH better!** 🚀

