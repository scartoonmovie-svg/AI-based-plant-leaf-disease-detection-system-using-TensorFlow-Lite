# 🖥️ Running AgriGuard on Your Laptop (Demo Mode)

Test AgriGuard on your laptop before deploying to Raspberry Pi!

## Quick Start

### 1. Install Dependencies

```bash
# On your laptop
cd AgriGuard
pip install -r requirements.txt
```

**Note**: On Windows, you might need:
```bash
pip install opencv-python flask flask-cors pyttsx3 numpy pillow
```

### 2. Test Your Webcam

```bash
python run_laptop_demo.py --mode test-camera
```

This will:
- Test if your webcam works
- Capture a test image
- Show camera preview (optional)

### 3. Run Web Interface

```bash
python run_laptop_demo.py --mode web
```

Then open your browser: **http://localhost:5000**

### 4. Run CLI Interface

```bash
python run_laptop_demo.py --mode cli
```

## What Works in Demo Mode

✅ **Web Interface** - Full UI with your webcam  
✅ **CLI Interface** - Command-line menu  
✅ **Camera Capture** - Uses laptop webcam  
✅ **Image Processing** - Full pipeline  
✅ **Database** - Scan history works  
✅ **Audio/TTS** - Voice feedback (if speakers)  

⚠️ **Models Required** - You need trained models for actual predictions

## Testing Without Models

You can test the UI and camera even without trained models:

1. The web interface will load
2. Camera will work
3. Scans will show an error (expected without models)
4. You can see the full workflow

## Training Models for Testing

To test with actual predictions:

```bash
# On laptop
python training/train_unified.py --crop tomato --mode fruit --base-model mobilenetv2 --epochs 20

# This creates models in models/fruit/tomato/tomato_fruit.tflite
# The system will automatically find and use them
```

## Demo Workflow

1. **Start web interface**: `python run_laptop_demo.py --mode web`
2. **Open browser**: http://localhost:5000
3. **Select crop and mode**
4. **Click "Capture & Analyze"**
5. **See results** (if models are available)

## Troubleshooting

### Webcam Not Working

- **Windows**: Make sure no other app is using the webcam
- **Mac**: Grant camera permissions in System Preferences
- **Linux**: Check `/dev/video0` exists: `ls -l /dev/video*`

### Models Not Found

- Train models first (see above)
- Or test UI without models (will show errors but UI works)

### Port Already in Use

```bash
python run_laptop_demo.py --mode web --port 8080
```

### Audio Not Working

- Install audio drivers
- On Windows: `pip install pywin32` might help
- Audio is optional - system works without it

## What's Different from Pi?

| Feature | Laptop Demo | Pi |
|---------|-------------|-----|
| Camera | Laptop webcam | Pi Camera/USB |
| Performance | Faster | Optimized for Pi |
| Models | Same | Same |
| UI | Same | Same |
| Audio | Laptop speakers | Pi speaker |

## Next Steps

Once you've tested on laptop:

1. ✅ Verify everything works
2. ✅ Train your models
3. ✅ Copy to Raspberry Pi
4. ✅ Run on Pi with same models

---

**Enjoy testing AgriGuard on your laptop!** 🎉

