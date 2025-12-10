# 🚀 AgriGuard v1 - Quick Start Guide

Get AgriGuard running in 10 minutes!

## Step 1: Setup Raspberry Pi (5 minutes)

**Note**: Works on Pi 4, Pi 3B+, and **Pi Zero 2W** (with automatic optimizations!)

```bash
# On your Raspberry Pi
cd ~
git clone <your-repo> AgriGuard  # or copy files
cd AgriGuard

# Run setup
chmod +x setup_pi.sh
./setup_pi.sh

# Activate virtual environment
source venv/bin/activate
```

## Step 2: Train Models on Laptop (5 minutes)

```bash
# On your laptop/desktop
cd AgriGuard
chmod +x setup_laptop.sh
./setup_laptop.sh
source venv/bin/activate

# Organize your images in data/raw/ (see README.md for structure)
# Then train:
python training/train_unified.py --crop tomato --mode fruit --epochs 30
python training/train_unified.py --crop tomato --mode leaf --epochs 30
```

## Step 3: Copy Models to Pi

```bash
# Copy .tflite files from laptop to Pi
scp models/fruit/tomato/tomato_fruit.tflite pi@raspberry-pi-ip:~/AgriGuard/models/fruit/
scp models/leaves/tomato/tomato_leaf.tflite pi@raspberry-pi-ip:~/AgriGuard/models/leaves/
```

## Step 4: Run AgriGuard

```bash
# On Raspberry Pi
cd ~/AgriGuard
source venv/bin/activate
python pi_app/main_pi.py --mode web
```

## Step 5: Access Web Interface

Open browser and go to: `http://raspberry-pi-ip:5000`

That's it! 🎉

---

## Troubleshooting

**Camera not working?**
```bash
sudo usermod -a -G video $USER
# Log out and back in
```

**Models not found?**
- Check that .tflite files are in `models/fruit/` and `models/leaves/`
- Update paths in `pi_app/config.py` if needed

**Port already in use?**
```bash
python pi_app/main_pi.py --mode web --port 8080
```

---

## Next Steps

- Add more training data for better accuracy
- Train models for other crops (potato, onion)
- Customize confidence thresholds in `config.py`
- Set up auto-start with systemd (see docs)

Happy farming! 🌾

