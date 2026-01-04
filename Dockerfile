FROM runpod/pytorch:2.4.0-py3.11-cuda12.4.1-devel-ubuntu22.04

LABEL maintainer="your-email@example.com"
LABEL description="Ultralytics YOLO Training Template with JupyterLab & File Browser"

ENV DEBIAN_FRONTEND=noninteractive
ENV JUPYTER_PORT=8888
ENV FILEBROWSER_PORT=8080
ENV ULTRALYTICS_VERSION=8.3.57

# Install system deps
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgl1-mesa-glx \
    libglib2.0-0 \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install uv
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
ENV PATH="/root/.local/bin:$PATH"

# Install File Browser
RUN curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash

# Install base packages
RUN uv pip install --system \
    jupyterlab \
    ipywidgets \
    albumentations

# Verify ultralytics can be installed (actual install at runtime for version flexibility)
RUN uv pip install --system ultralytics && \
    python -c "from ultralytics import YOLO; print('Ultralytics OK')" && \
    uv pip uninstall --system ultralytics

COPY start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /workspace

EXPOSE 8888 8080

CMD ["/start.sh"]
