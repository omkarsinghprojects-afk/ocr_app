#!/bin/bash
# build.sh — runs during Render build phase
apt-get update && apt-get install -y poppler-utils
pip install -r requirements.txt
