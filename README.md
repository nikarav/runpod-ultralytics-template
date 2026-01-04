# RunPod Ultralytics YOLO Template

[![Deploy on RunPod](https://img.shields.io/badge/Deploy-RunPod-blueviolet)](https://runpod.io/console/deploy?template=h6tbid6ucb)

One-click GPU environment for training YOLO models. No setup needed. Use this [link](https://runpod.io/console/deploy?template=h6tbid6ucb) to deploy on runpod.

## What's inside

- Ultralytics (configurable version)
- JupyterLab (port 8888)
- File Browser (port 8080) — drag & drop your files

## Usage

1. Click deploy button
2. Pick a GPU
3. Upload dataset via File Browser
4. Train:
```python
from ultralytics import YOLO

model = YOLO('yolov8n.pt')
model.train(data='dataset.yaml', epochs=100)
```

## Config

Set `ULTRALYTICS_VERSION` env var to change version (default: `8.3.57`)

## License

MIT. Note that Ultralytics itself is AGPL-3.0.
