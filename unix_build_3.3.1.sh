#!/bin/bash

OPENCV_SOURCE_DIR="$1"
cd "$OPENCV_SOURCE_DIR"

git checkout 3.3.1 -b 3.3.1
mkdir -p build && cd build
cmake .. \
    -DCMAKE_INSTALL_PREFIX="/opt/opencv-3.3.1"
