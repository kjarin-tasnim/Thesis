#!/bin/bash

set -e

cd "$(dirname "$0")"

echo "Stopping old container..."
docker compose down

echo ""
echo "Rebuilding Docker image..."
docker compose build --no-cache

echo ""
echo "Starting new container..."
docker compose up -d

xhost +local:docker >/dev/null 2>&1

echo ""
echo "======================================"
echo " Docker image rebuilt successfully."
echo ""
echo "Open VS Code:"
echo "  Ctrl+Shift+P"
echo "  Dev Containers: Reopen in Container"
echo "======================================"
