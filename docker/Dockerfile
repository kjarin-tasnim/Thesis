FROM osrf/ros:noetic-desktop-full

ENV DEBIAN_FRONTEND=noninteractive
ENV ROS_DISTRO=noetic

# ----------------------------
# Create normal (non-root) user
# ----------------------------
ARG USERNAME=ros
ARG USER_UID=1000
ARG USER_GID=1000

RUN groupadd --gid ${USER_GID} ${USERNAME} && \
    useradd \
        --uid ${USER_UID} \
        --gid ${USER_GID} \
        -m \
        -s /bin/bash \
        ${USERNAME}
        
RUN usermod -aG sudo ${USERNAME} && \
    echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME}

# ----------------------------
# Install development tools
# ----------------------------
RUN apt-get update && apt-get install -y \
    python3-catkin-tools \
    python3-rosdep \
    python3-pip \
    python3-vcstool \
    python3-rosinstall \
    python3-argcomplete \
    build-essential \
    cmake \
    sudo \
    git \
    git-lfs \
    curl \
    wget \
    nano \
    vim \
    less \
    tmux \
    htop \
    tree \
    mesa-utils \
    bash-completion \
    net-tools \
    iputils-ping \
    usbutils \
    x11-apps \
    libglu1-mesa \
    freeglut3-dev \
    ros-noetic-rviz \
    ros-noetic-rqt \
    ros-noetic-rqt-common-plugins \
    ros-noetic-xacro \
    ros-noetic-joint-state-publisher-gui \
    ros-noetic-robot-state-publisher \
    ros-noetic-ros-control \
    ros-noetic-ros-controllers \
    ros-noetic-controller-manager \
    ros-noetic-moveit \
    ros-noetic-gazebo-ros-pkgs \
    ros-noetic-gazebo-ros-control \
    ros-noetic-gazebo-plugins \
 && rm -rf /var/lib/apt/lists/*

RUN pip3 install \
    numpy \
    scipy \
    matplotlib \
    pandas \
    transforms3d \
    pyserial

RUN rosdep init || true

COPY ros_entrypoint.sh /

RUN chmod +x /ros_entrypoint.sh

RUN mkdir -p /home/${USERNAME}/catkin_ws/src && \
    chown -R ${USERNAME}:${USERNAME} /home/${USERNAME}

USER ${USERNAME}

RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc && \
    echo "if [ -f ~/catkin_ws/devel/setup.bash ]; then source ~/catkin_ws/devel/setup.bash; fi" >> ~/.bashrc

WORKDIR /home/${USERNAME}/catkin_ws

ENTRYPOINT ["/ros_entrypoint.sh"]

CMD ["bash"]
