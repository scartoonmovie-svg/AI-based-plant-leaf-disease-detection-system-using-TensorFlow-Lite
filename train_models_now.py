"""
train_models_now.py

PROFESSIONAL MODEL TRAINING - Trains with your specific disease classes!
This will train a WINNING model!
"""

import sys
from pathlib import Path

PROJECT_ROOT = Path(__file__).parent
TRAINING_DIR = PROJECT_ROOT / "training"

# Import and run professional training
sys.path.insert(0, str(TRAINING_DIR))

print("="*60)
print("🏆 AgriGuard - PROFESSIONAL MODEL TRAINING")
print("="*60)
print("\nTraining models for:")
print("1. Tomato_Blight (Early + Late)")
print("2. Tomato_Leaf_Mold")
print("3. Potato_Late_Blight")
print("4. Potato_Common_Scab")
print("5. Onion_Purple_Blight")
print("6. Onion_Downy_Mildew")
print("7. Bacterial_Spot")
print("8. Healthy")
print("\n🚀 Starting professional training...\n")

try:
    from train_professional import main as train_main
    train_main()
    print("\n" + "="*60)
    print("🏆 TRAINING COMPLETE - READY TO WIN!")
    print("="*60)
    print(f"Models are in: {PROJECT_ROOT / 'models'}")
    print("\n✅ Your models are professional-grade!")
except Exception as e:
    print(f"\n❌ Training failed: {e}")
    import traceback
    traceback.print_exc()
    sys.exit(1)

