FROM node:10-stretch

# ENV OPENCV_VERSION 4.0.1
ENV STORAGE_DIR /mnt/sorted/
ENV CACHE_DIR /mnt/cache/
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
# Cleaning
  apt autoremove -y && \
  rm -rf /var/lib/apt/lists/* 
