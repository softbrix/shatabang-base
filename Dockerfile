FROM node:carbon-stretch

# ENV OPENCV_VERSION 4.0.1
ENV NODE_OPENCV_VERSION 4.15.0
ENV STORAGE_DIR /mnt/sorted/
ENV CACHE_DIR /mnt/cache/
ENV SERVER_DIR /usr/src/shatabang/
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
  cmake \
  libgtk2.0-dev \
  pkg-config \
  libavcodec-dev \
  libavformat-dev \
  libswscale-dev && \
# Build and install opencv3
#  wget -q -O opencv.zip https://github.com/opencv/opencv/archive/$OPENCV_VERSION.zip && \
#  unzip opencv.zip && \
#  cd opencv-$OPENCV_VERSION && \
#  mkdir build && cd build && \
#  cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local .. && \
#  make -j4 && make install && \
#  ldconfig -v && \
# Create app directories
  mkdir -p $STORAGE_DIR $CACHE_DIR $CLIENT_DIR && \
# Install the heavy modules in the base
  cd $SERVER_DIR && \
  npm init -y && \
  npm install --save opencv4nodejs@$NODE_OPENCV_VERSION && \
# Cleaning up
  apt autoremove -y && \
  rm -rf /var/lib/apt/lists/* 
