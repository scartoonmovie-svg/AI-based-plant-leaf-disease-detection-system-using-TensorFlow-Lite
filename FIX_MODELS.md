# Fixing model loading & training issues

This file explains common issues and fixes for models not loading, and training problems.

## Quick fixes

1. Ensure virtualenv packages are installed:

   ```powershell
   C:/ShadowAI/AgriGuard/.venv/Scripts/python.exe -m pip install -r requirements.txt
   ```

2. If PyTorch models (.pth) fail to load due to mismatched checkpoint formats (e.g., checkpoints were exported with a different ViT implementation), convert them to a torchvision-compatible state dict using the provided tool:

   ```powershell
   C:/ShadowAI/AgriGuard/.venv/Scripts/python.exe tools/convert_pth_to_compatible_vit.py models/fruit/fruit_vit.pth models/fruit/class_names.json
   C:/ShadowAI/AgriGuard/.venv/Scripts/python.exe tools/convert_pth_to_compatible_vit.py models/leaves/leaf_vit.pth models/leaves/class_names.json
   ```

   The script will produce `fruit_vit_compat.pth` and `leaf_vit_compat.pth` files. The app will prefer these `*_compat.pth` files when available.

3. If TFLite models do not load on a laptop, install `tflite-runtime` or `tensorflow` (recommended on laptop):

   ```powershell
   C:/ShadowAI/AgriGuard/.venv/Scripts/python.exe -m pip install tflite-runtime
   # or
   C:/ShadowAI/AgriGuard/.venv/Scripts/python.exe -m pip install tensorflow
   ```

   The TFLite loader now gracefully handles the absence of tflite runtime and will not crash the app — it just disables TFLite models.

## How to run the server locally

1. Activate your venv and install requirements.
2. Launch the server:

   ```powershell
   C:/ShadowAI/AgriGuard/.venv/Scripts/python.exe laptop_server/server.py
   ```

3. Check the health endpoint:

   ```powershell
   C:/ShadowAI/AgriGuard/.venv/Scripts/python.exe -c "import requests; print(requests.get('http://127.0.0.1:5000/api/health').json())"
   ```

## Training issues

- Training scripts use TensorFlow/Keras (see `training/train_unified.py`). Ensure `tensorflow` is installed if you plan to train on laptop.
- The training scripts save best weights as `best_model.h5` and also convert to TFLite; they will not automatically produce `.pth` PyTorch state dicts.
- If you need a PyTorch model, consider training with Torch or use the conversion pipeline; ensure the resulting `.pth` is compatible with the `pytorch_inference` module or use the conversion tool above.

## Debugging tips

- If models don't load, check `logs/pi_runtime.log` and server logs for stack traces.
- Confirm model files exist in `models/fruit/` and `models/leaves/`.
- For inference issues, test with `tools/test_load_models.py` and `tools/test_compat_load.py`.

If you'd like, I can now:
- Convert the provided pth files and update the repo automatically,
- Add a small script to re-save the compat files as the main `fruit_vit.pth`,
- Add more robust mapping to `pytorch_inference` for other checkpoint formats,
- Or help you install TFLite runtime or TensorFlow on the target machine (Pi/laptop).

Tell me which of the above you want me to do next.
