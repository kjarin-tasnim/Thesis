FROM osrf/ros:noetic-desktop-full

ENV DEBIAN_FRONTEND=noninteractive
ENV ROS_DISTRO=noetic
ENV PYTHONUNBUFFERED=1

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
    libgl1 \
    libglib2.0-0 \
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
 
RUN python3 -m pip install --upgrade pip setuptools wheel

RUN pip3 install --no-cache-dir \
    numpy==1.24.4 \
    scipy==1.10.1 \
    matplotlib==3.7.5 \
    pandas==2.0.3 \
    pygame==2.6.1 \
    transforms3d \
    pyserial \
    opencv-python==4.11.0.86 \
    gymnasium==1.0.0 \
    stable-baselines3==2.4.1 \
    tensorboard==2.14.0 \
    protobuf==4.25.3 \
    torch==2.4.1 \
    torchvision==0.19.1 \
    torchaudio==2.4.1 \
    tqdm==4.68.3 \
    imageio==2.35.1 \
    imageio-ffmpeg==0.5.1 \
    jupyterlab==4.3.8 \
    ipykernel==6.29.5


RUN rosdep init || true

COPY ros_entrypoint.sh /

RUN chmod +x /ros_entrypoint.sh

RUN chown -R ${USERNAME}:${USERNAME} /home/${USERNAME}

USER ${USERNAME}

RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc && \
    echo "if [ -f ~/catkin_ws/devel/setup.bash ]; then source ~/catkin_ws/devel/setup.bash; fi" >> ~/.bashrc

WORKDIR /home/${USERNAME}/catkin_ws

ENTRYPOINT ["/ros_entrypoint.sh"]

CMD ["bash"]
