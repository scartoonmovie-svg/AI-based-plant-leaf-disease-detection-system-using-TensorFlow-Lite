import requests

# Test the training capture endpoint
url = "http://localhost:5000/api/train/capture"
image_path = "data/captures/tomato_fruit_20251209_005110.jpg"

# Prepare the form data
files = {'image': open(image_path, 'rb')}
data = {
    'crop_type': 'tomato',
    'mode': 'fruit',
    'label': 'fresh'
}

try:
    response = requests.post(url, files=files, data=data)
    print(f"Status Code: {response.status_code}")
    print(f"Response: {response.json()}")
except Exception as e:
    print(f"Error: {e}")
