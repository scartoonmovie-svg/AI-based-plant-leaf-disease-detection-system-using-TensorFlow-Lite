# ⚡ Quick Test on Your Laptop

## 3-Step Test (2 minutes!)

### Step 1: Install Dependencies

**Windows:**
```cmd
pip install opencv-python flask flask-cors pyttsx3 numpy pillow
```

**Mac/Linux:**
```bash
pip3 install opencv-python flask flask-cors pyttsx3 numpy pillow
```

### Step 2: Test Camera

```bash
python run_laptop_demo.py --mode test-camera
```

If this works, your webcam is ready! ✅

### Step 3: Run Web Interface

```bash
python run_laptop_demo.py --mode web
```

Then open: **http://localhost:5000**

---

## What You'll See

1. **Beautiful web interface** - Same as on Pi!
2. **Camera capture** - Uses your laptop webcam
3. **UI works** - All buttons and features
4. **Scan will show error** - (Expected without models)

## To Test With Real Predictions

Train a quick model:

```bash
# Create test data folders first
mkdir -p data/raw/fruit/tomato/fresh
mkdir -p data/raw/fruit/tomato/spoiled

# Add some images to those folders, then:
python training/train_unified.py --crop tomato --mode fruit --base-model mobilenetv2 --epochs 10
```

Then scans will work with real predictions! 🎉

---

**That's it! Test everything on your laptop before deploying to Pi!**

