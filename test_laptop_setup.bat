@echo off
REM Quick test script for Windows laptop

echo ========================================
echo AgriGuard v1 - Laptop Setup Test
echo ========================================
echo.

echo Checking Python...
python --version
if errorlevel 1 (
    echo ERROR: Python not found!
    pause
    exit /b 1
)

echo.
echo Installing dependencies...
pip install opencv-python flask flask-cors pyttsx3 numpy pillow python-dotenv click

echo.
echo Testing camera...
python run_laptop_demo.py --mode test-camera

echo.
echo ========================================
echo Setup complete!
echo.
echo To run web interface:
echo   python run_laptop_demo.py --mode web
echo.
echo Then open: http://localhost:5000
echo ========================================
pause

