# Copy Files to Pi - Exact Commands

## The Problem
Files are in `./AgriGuard/pi_client/` but need to be in `~/AgriGuard/pi_client/`

## Solution - Run These Commands on Pi:

```bash
cd ~/AgriGuard
# Copy files from nested location
cp AgriGuard/pi_client/simple_server.py pi_client/
cp AgriGuard/pi_client/camera_client.py pi_client/

# Verify files are there
cd pi_client
ls -la
# Should see: simple_server.py and camera_client.py

# Deactivate broken venv and run
deactivate 2>/dev/null
python3 simple_server.py
```

---

## All-in-One Command:

```bash
cd ~/AgriGuard && cp AgriGuard/pi_client/simple_server.py pi_client/ && cp AgriGuard/pi_client/camera_client.py pi_client/ && cd pi_client && deactivate 2>/dev/null && python3 simple_server.py
```

---

## If Files Still Missing - Copy from Laptop:

On laptop (new terminal):
```cmd
scp C:\ShadowAI\AgriGuard\pi_client\simple_server.py shadow@192.168.137.182:~/AgriGuard/pi_client/
scp C:\ShadowAI\AgriGuard\pi_client\camera_client.py shadow@192.168.137.182:~/AgriGuard/pi_client/
```

Then on Pi:
```bash
cd ~/AgriGuard/pi_client
python3 simple_server.py
```

