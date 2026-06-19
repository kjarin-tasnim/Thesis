#!/bin/bash
set -e

source /opt/ros/noetic/setup.bash

if [ -f /home/ros/catkin_ws/devel/setup.bash ]; then
    source /home/ros/catkin_ws/devel/setup.bash
fi

exec "$@"
