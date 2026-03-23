#!/bin/bash
set -e
apt-get update && apt-get install -y \
    poppler-utils \
    libjpeg-dev \
    zlib1g-dev \
    libpng-dev \
    libwebp-dev \
    libtiff-dev

pip install --upgrade pip
pip install -r requirements.txt
```

---

**requirements.txt** — replace the whole file with this:
```
fastapi==0.111.0
uvicorn==0.30.1
python-multipart==0.0.9
aiofiles==23.2.1
google-generativeai==0.8.3
pdf2image==1.17.0
Pillow==11.1.0
openpyxl==3.1.2
