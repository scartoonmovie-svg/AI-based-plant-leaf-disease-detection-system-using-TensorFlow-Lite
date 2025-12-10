# 🌾 AgriGuard v1 - Smart Agriculture Assistant

**Production-Grade AI System for Food Safety & Plant Health Detection**

AgriGuard v1 is an offline, Raspberry Pi-based AI system that helps farmers and home users detect:
- **Kitchen Mode**: Whether vegetables (tomato, potato, onion) are fresh or spoiled
- **Farm Mode**: Whether plant leaves (tomato, potato) are healthy or diseased

---

## 🚀 Key Features

### Core Capabilities
- ✅ **Offline Operation** - Works without internet connection
- ✅ **Real-time Detection** - Instant results from camera capture
- ✅ **Voice Feedback** - Spoken results in multiple languages
- ✅ **Web Interface** - Modern, responsive web UI
- ✅ **CLI Interface** - Simple command-line interface
- ✅ **Scan History** - Database of all scans with timestamps
- ✅ **Multi-Crop Support** - Tomato, Potato, Onion
- ✅ **Production Ready** - Error handling, logging, health checks

### Advanced Features
- 🎯 **High Accuracy** - Transfer learning with MobileNetV2/EfficientNet
- 📊 **Statistics Dashboard** - View scan history and trends
- 🔄 **Model Versioning** - Easy model updates
- 🌍 **Multi-language TTS** - English, Hindi, and more
- 📸 **Image Storage** - All scanned images saved for review
- ⚡ **Fast Inference** - Optimized TFLite models for Raspberry Pi

---

## 📋 Requirements

### Hardware
- **Raspberry Pi 4** (recommended) or **Pi Zero 2W** (fully supported with optimizations)
- **Raspberry Pi Camera Module** or USB webcam
- **Speaker** (wired or Bluetooth) for audio feedback
- **MicroSD Card** (32GB+ recommended, 64GB perfect)

### Software
- **Raspberry Pi OS** (Bullseye or later)
- **Python 3.8+**
- **Camera drivers** (libcamera for Pi Camera)

---

## 🛠️ Installation

### On Raspberry Pi

1. **Clone or copy this repository to your Pi**

2. **Run setup script:**
   ```bash
   chmod +x setup_pi.sh
   ./setup_pi.sh
   ```

3. **Activate virtual environment:**
   ```bash
   source venv/bin/activate
   ```

4. **Train models on your laptop** (see Training section)

5. **Copy trained models to Pi:**
   ```bash
   # Copy .tflite files to models/fruit/ and models/leaves/
   ```

6. **Run AgriGuard:**
   ```bash
   # Web mode (recommended)
   python pi_app/main_pi.py --mode web
   
   # CLI mode
   python pi_app/main_pi.py --mode cli
   ```

7. **Access web interface:**
   - Open browser: `http://raspberry-pi-ip:5000`
   - Or on Pi: `http://localhost:5000`

### On Laptop (for Training)

1. **Run setup script:**
   ```bash
   chmod +x setup_laptop.sh
   ./setup_laptop.sh
   ```

2. **Activate virtual environment:**
   ```bash
   source venv/bin/activate
   ```

---

## 🎓 Training Models

### Data Preparation

Organize your training images in this structure:

```
data/raw/
├── fruit/
│   ├── tomato/
│   │   ├── fresh/
│   │   └── spoiled/
│   ├── potato/
│   │   ├── fresh/
│   │   └── spoiled/
│   └── onion/
│       ├── fresh/
│       └── spoiled/
└── leaves/
    ├── tomato/
    │   ├── healthy/
    │   └── diseased/
    └── potato/
        ├── healthy/
        └── diseased/
```

### Training Commands

```bash
# Train tomato fruit model
python training/train_unified.py --crop tomato --mode fruit --epochs 50

# Train potato fruit model
python training/train_unified.py --crop potato --mode fruit --epochs 50

# Train onion fruit model
python training/train_unified.py --crop onion --mode fruit --epochs 50

# Train tomato leaf model
python training/train_unified.py --crop tomato --mode leaf --epochs 50

# Train potato leaf model
python training/train_unified.py --crop potato --mode leaf --epochs 50
```

### Training Options

- `--base-model`: Choose `mobilenetv2` (faster) or `efficientnet` (more accurate)
- `--epochs`: Number of training epochs (default: 50)
- `--batch-size`: Batch size (default: 32)

### Model Output

Trained models are saved to:
- `models/{mode}/{crop_type}/{crop_type}_{mode}.tflite`
- `models/{mode}/{crop_type}/class_names.json`

Copy these files to your Raspberry Pi.

---

## 📖 Usage

### Web Interface

1. Start web server:
   ```bash
   python pi_app/main_pi.py --mode web
   ```

2. Open browser and navigate to the Pi's IP address (port 5000)

3. Select crop type and scan mode

4. Click "Capture & Analyze"

5. View results and history

### CLI Interface

1. Start CLI:
   ```bash
   python pi_app/main_pi.py --mode cli
   ```

2. Follow on-screen menu prompts

3. Select crop type and mode

4. Results are displayed and spoken

---

## 🏗️ Project Structure

```
AgriGuard/
├── pi_app/              # Raspberry Pi application
│   ├── main_pi.py      # Main entry point
│   ├── web_app.py      # Flask web application
│   ├── ui_cli.py        # CLI interface
│   ├── camera_capture.py # Camera management
│   ├── image_utils.py   # Image preprocessing
│   ├── tflite_inference.py # Model inference
│   ├── audio_utils.py   # Text-to-speech
│   ├── database.py      # Scan history database
│   └── config.py        # Configuration
├── training/            # Training scripts
│   ├── train_unified.py # Unified training script
│   └── ...
├── web/                 # Web interface
│   ├── templates/      # HTML templates
│   └── static/         # CSS, JS, images
├── data/               # Data directories
│   ├── raw/           # Raw training images
│   ├── processed/     # Processed data
│   ├── captures/      # Captured images
│   └── scans.db       # SQLite database
├── models/             # Trained models
│   ├── fruit/         # Fruit models
│   └── leaves/        # Leaf models
├── logs/              # Log files
├── requirements.txt   # Python dependencies (laptop)
├── requirements_pi.txt # Python dependencies (Pi)
├── setup_pi.sh        # Pi setup script
├── setup_laptop.sh    # Laptop setup script
└── README.md          # This file
```

---

## 🔧 Configuration

Edit `pi_app/config.py` to customize:

- Model paths
- Image size
- Confidence thresholds
- Camera settings
- Logging options

---

## 🐛 Troubleshooting

### Pi Zero 2W Users

If you're using **Raspberry Pi Zero 2W**, see the detailed guide:
- **[Pi Zero 2W Optimization Guide](docs/PI_ZERO_2W_GUIDE.md)**

Key points:
- ✅ Fully supported with automatic optimizations
- ✅ Use MobileNetV2 models (not EfficientNet)
- ✅ CLI mode recommended for best performance
- ✅ 64GB SD card is perfect!

### Camera Issues

- **Camera not detected**: Check camera connection and drivers
- **Permission denied**: Add user to `video` group: `sudo usermod -a -G video $USER`
- **USB camera**: Update `CAMERA_INDEX` in `config.py`

### Model Issues

- **Model not found**: Ensure `.tflite` files are in `models/` directory
- **Low accuracy**: Retrain with more/better data
- **Slow inference**: Use MobileNetV2 instead of EfficientNet

### Audio Issues

- **No sound**: Check speaker connection and volume
- **TTS not working**: Install `espeak`: `sudo apt-get install espeak`

### Web Interface Issues

- **Can't access**: Check firewall and Pi's IP address
- **Port in use**: Change port: `--port 8080`

---

## 📊 Performance

### Model Sizes
- MobileNetV2: ~5-10 MB per model
- EfficientNet: ~15-25 MB per model

### Inference Speed (Raspberry Pi 4)
- MobileNetV2: ~50-100ms per image
- EfficientNet: ~150-300ms per image

### Accuracy
- Fruit detection: 85-95% (depends on data quality)
- Leaf detection: 80-90% (depends on data quality)

---

## 🔮 Future Enhancements

- [ ] Support for more crops (chili, brinjal, etc.)
- [ ] More disease types
- [ ] Mobile app companion
- [ ] Cloud sync (optional)
- [ ] Multi-language UI
- [ ] Batch processing mode
- [ ] Export reports (PDF)
- [ ] Integration with agricultural APIs

---

## 📝 License

This project is open source. Feel free to use, modify, and distribute.

---

## 🙏 Acknowledgments

- **PlantVillage Dataset** - Reference for leaf disease data
- **TensorFlow Team** - ML framework
- **Raspberry Pi Foundation** - Hardware platform

---

## 📧 Support

For issues, questions, or contributions, please open an issue on the project repository.

---

**Made with ❤️ for farmers and home users worldwide**
