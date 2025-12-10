# 🔧 Fix Pi Client - Run These Commands

## Problem Found:
1. Files are in `./AgriGuard/pi_client/` (nested directory)
2. Venv is broken

## Solution - Run These Commands on Pi:

### Step 1: Copy files to correct location

```bash
cd ~/AgriGuard
cp -r AgriGuard/pi_client/* pi_client/ 2>/dev/null || cp pi_client/* pi_client/ 2>/dev/null || echo "Files already there"
```

### Step 2: Deactivate broken venv and use system Python

```bash
deactivate
cd ~/AgriGuard/pi_client
python3 simple_server.py
```

---

## All-in-One Command:

```bash
cd ~/AgriGuard && deactivate 2>/dev/null; cp -r AgriGuard/pi_client/* pi_client/ 2>/dev/null; cd pi_client && python3 simple_server.py
```

---

## If files still missing, copy from laptop:

On laptop (new terminal):
```cmd
scp C:\ShadowAI\AgriGuard\pi_client\*.py shadow@192.168.137.182:~/AgriGuard/pi_client/
```

Then on Pi:
```bash
cd ~/AgriGuard/pi_client
python3 simple_server.py
```

