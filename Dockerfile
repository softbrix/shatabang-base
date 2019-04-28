FROM node:carbon-stretch

# ENV OPENCV_VERSION 4.0.1
ENV NODE_OPENCV_VERSION 4.14.1
ENV STORAGE_DIR /mnt/sorted/
ENV CACHE_DIR /mnt/cache/
ENV CLIENT_DIR /usr/src/shatabang/client
# ENV OPENCV4NODEJS_DISABLE_AUTOBUILD 0
# ENV OPENCV_LIB_DIR /usr/local/lib/
# ENV OPENCV_DIR /usr/local/

RUN apt-get update && apt-get install -y --no-install-recommends \
#  git \
#  libopencv-dev \
  libimage-exiftool-perl \
  libvips-dev \
  ffmpeg \
#  yarn   \
  cmake \
  libgtk2.0-dev \
  pkg-config \
  libavcodec-dev \
  libavformat-dev \
  libswscale-dev && \
# unzip && \
#  cd ~/ && \
# Build and install opencv3
#  wget -q -O opencv.zip https://github.com/opencv/opencv/archive/$OPENCV_VERSION.zip && \
#  unzip opencv.zip && \
#  cd opencv-$OPENCV_VERSION && \
#  mkdir build && cd build && \
#  cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local .. && \
#  make -j4 && make install && \
#  ldconfig -v && \
  cd /usr/src/shatabang/ && \
  npm install opencv4nodejs@$NODE_OPENCV_VERSION && \
# Install ember
#  yarn global add ember-cli && \
# Create app directories
  mkdir -p $STORAGE_DIR $CACHE_DIR $CLIENT_DIR && \
# Cleaning
#  cd ~/ && rm -rf * && \
#  apt-get remove -y \
  # cmake \
  # pkg-config \
#  unzip && \
  apt autoremove -y && \
  rm -rf /var/lib/apt/lists/* 

ENV OPENCV4NODEJS_DISABLE_AUTOBUILD 1
