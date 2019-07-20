FROM node:10-stretch

# ENV OPENCV_VERSION 4.0.1
ENV NODE_OPENCV_VERSION 4.17.0
ENV STORAGE_DIR /mnt/sorted/
ENV CACHE_DIR /mnt/cache/
ENV SERVER_DIR /usr/src/shatabang/
ENV CLIENT_DIR /usr/src/shatabang/client

RUN apt-get update && apt-get install -y --no-install-recommends \
  libimage-exiftool-perl \
  libvips-dev \
  ffmpeg \
  cmake \
  libgtk2.0-dev \
  pkg-config \
  libavcodec-dev \
  libavformat-dev \
  libswscale-dev && \
# Create app directories
  mkdir -p $STORAGE_DIR $CACHE_DIR $CLIENT_DIR && \
# Install the heavy modules in the base
  cd $SERVER_DIR && \
  npm init -y && \
  npm install --save opencv4nodejs@$NODE_OPENCV_VERSION && \
# Cleaning up
  apt autoremove -y && \
  rm -rf /var/lib/apt/lists/* 
