# 🔧 Setup Pi Client - Exact Commands

## Your Pi doesn't have pi_client directory yet!

Run these commands on your Pi:

### Step 1: Create directory and copy files

```bash
cd ~/AgriGuard
mkdir -p pi_client
cd pi_client
```

### Step 2: Copy files from main directory

The files were transferred but need to be in pi_client folder:

```bash
# If files are in wrong location, move them:
cd ~/AgriGuard
cp pi_client/camera_client.py pi_client/ 2>/dev/null || echo "File already there"
cp pi_client/simple_server.py pi_client/ 2>/dev/null || echo "File already there"
```

Actually, if you transferred the whole AgriGuard folder, the files should be there. Let's check:

```bash
cd ~/AgriGuard/pi_client
ls -la
```

You should see:
- `camera_client.py`
- `simple_server.py`
- `requirements.txt`

### Step 3: Run Pi Client

```bash
cd ~/AgriGuard/pi_client
python3 simple_server.py
```

That's it! The laptop IP (192.168.137.1) is already set as default.

---

## If directory doesn't exist, create it manually:

```bash
cd ~/AgriGuard
mkdir -p pi_client
cd pi_client

# Create files (or copy from laptop)
cat > camera_client.py << 'ENDOFFILE'
[paste camera_client.py content]
ENDOFFILE

cat > simple_server.py << 'ENDOFFILE'
[paste simple_server.py content]
ENDOFFILE
```

But easier: just check if files exist first!

