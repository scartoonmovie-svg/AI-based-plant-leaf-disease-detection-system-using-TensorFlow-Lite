# 🔄 Restart Server - Fix 404 Error

## The Problem
Server returns 404 when Pi sends images because models aren't loaded.

## The Fix
I've updated the server to:
1. ✅ Accept images even without models
2. ✅ Return proper error (503) instead of 404
3. ✅ Save images for later use
4. ✅ Better logging to debug

## Restart Laptop Server

**Stop current server:**
- Press `Ctrl+C` in the laptop server terminal

**Restart:**
```cmd
cd C:\ShadowAI\AgriGuard\laptop_server
python server.py
```

## What You'll See Now

When you scan without models:
- ✅ Image will be saved
- ✅ Server returns 503 (Service Unavailable) instead of 404
- ✅ Better error message: "Model not available, but image saved"

## After Restart

1. **Try scan again** from web interface
2. **Check logs** - you'll see:
   - "Processing image: tomato fruit, file size: X bytes"
   - "Image saved to: ..."
   - "Model for mode 'fruit' not available"

The 404 error should be fixed! 🎉

