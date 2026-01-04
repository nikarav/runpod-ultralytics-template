#!/bin/bash
set -e

echo "============================================"
echo "  Ultralytics YOLO Training Pod"
echo "  Installing ultralytics==${ULTRALYTICS_VERSION}"
echo "============================================"

# Install ultralytics at runtime (user can override version via env var)
uv pip install --system "ultralytics==${ULTRALYTICS_VERSION}"

# Start File Browser
filebrowser -a 0.0.0.0 -p ${FILEBROWSER_PORT} -r /workspace --noauth &
echo "✓ File Browser: port ${FILEBROWSER_PORT}"

# Start JupyterLab with proxy-friendly settings
jupyter lab \
    --ip=0.0.0.0 \
    --port=${JUPYTER_PORT} \
    --no-browser \
    --allow-root \
    --ServerApp.token='' \
    --ServerApp.password='' \
    --ServerApp.allow_origin='*' \
    --ServerApp.allow_remote_access=True \
    --ServerApp.disable_check_xsrf=True \
    --ServerApp.terminals_enabled=True &
echo "✓ JupyterLab: port ${JUPYTER_PORT}"

echo "============================================"
echo "  Ready! Open HTTP ports in RunPod console"
echo "============================================"

sleep infinity