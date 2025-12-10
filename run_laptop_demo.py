"""
run_laptop_demo.py

Run AgriGuard on your laptop for testing before deploying to Pi.
This uses your laptop's webcam and works on Windows, Mac, and Linux.
"""

import sys
import logging
from pathlib import Path

# Add pi_app to path
sys.path.insert(0, str(Path(__file__).parent / "pi_app"))

from config import setup_logging, PROJECT_ROOT
from camera_capture_laptop import LaptopCameraManager, CameraError
from image_utils import load_and_preprocess_image
from tflite_inference import TFLiteModel
from audio_utils import get_audio_manager
from database import get_database
from web_app import app, initialize_app

# Note: web_app and ui_cli will automatically use LaptopCameraManager
# via the try/except imports we added
from ui_cli import run_cli_interface


def main():
    """Run AgriGuard in laptop demo mode."""
    import argparse
    
    parser = argparse.ArgumentParser(description='AgriGuard v1 - Laptop Demo Mode')
    parser.add_argument(
        '--mode',
        type=str,
        choices=['cli', 'web', 'test-camera'],
        default='web',
        help='Run mode: cli, web, or test-camera'
    )
    parser.add_argument(
        '--port',
        type=int,
        default=5000,
        help='Web server port (web mode only)'
    )
    parser.add_argument(
        '--host',
        type=str,
        default='127.0.0.1',
        help='Web server host (web mode only)'
    )
    
    args = parser.parse_args()
    
    # Setup logging
    setup_logging()
    logger = logging.getLogger(__name__)
    
    logger.info("="*60)
    logger.info("AgriGuard v1 - Laptop Demo Mode")
    logger.info("="*60)
    logger.info("This mode uses your laptop's webcam for testing")
    logger.info("="*60)
    
    if args.mode == 'test-camera':
        # Just test camera
        logger.info("Testing camera...")
        cam = LaptopCameraManager()
        try:
            cam.open()
            logger.info("✅ Camera opened successfully!")
            
            test_path = PROJECT_ROOT / "test_capture.jpg"
            success, msg = cam.capture_image(test_path)
            
            if success:
                logger.info(f"✅ Test capture successful! Image: {test_path}")
                logger.info("You can now run AgriGuard in web or CLI mode")
            else:
                logger.error(f"❌ Capture failed: {msg}")
            
            # Show preview
            response = input("\nShow camera preview? (y/n): ")
            if response.lower() == 'y':
                cam.preview(duration=0)
            
        except CameraError as e:
            logger.error(f"❌ Camera error: {e}")
            logger.error("Make sure your webcam is connected and not used by another app")
            sys.exit(1)
        finally:
            cam.close()
        return
    
    # Validate models (optional for demo)
    try:
        from config import validate_paths
        validate_paths()
        logger.info("✅ Models found")
    except FileNotFoundError as e:
        logger.warning(f"⚠️  Models not found: {e}")
        logger.warning("⚠️  You can still test the UI, but scans won't work without models")
        logger.warning("⚠️  Train models first or use test mode")
        response = input("\nContinue anyway? (y/n): ")
        if response.lower() != 'y':
            sys.exit(1)
    
    if args.mode == 'cli':
        logger.info("Starting CLI interface (laptop mode)...")
        # Patch the CLI to use laptop camera
        run_cli_interface()
    else:
        logger.info(f"Starting web server on {args.host}:{args.port}...")
        logger.info(f"Open browser: http://{args.host}:{args.port}")
        initialize_app()
        app.run(host=args.host, port=args.port, debug=False)


if __name__ == '__main__':
    main()

