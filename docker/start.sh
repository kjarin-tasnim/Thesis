#!/bin/bash

set -e

cd "$(dirname "$0")"

# Allow Docker GUI applications (RViz, Gazebo)
xhost +local:docker >/dev/null 2>&1

docker compose up -d

echo ""
echo "======================================"
echo " ROS1 Noetic container is running."
echo ""
echo "Open VS Code:"
echo "  Ctrl+Shift+P"
echo "  Dev Containers: Reopen in Container"
echo "======================================"
