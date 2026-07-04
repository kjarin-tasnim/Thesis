#!/bin/bash

set -e

cd "$(dirname "$0")"

docker compose stop

xhost -local:docker >/dev/null 2>&1 || true

echo "ROS1 container stopped."
