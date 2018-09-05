#!/bin/bash

OPENCV_SOURCE_DIR="$1"
cd "$OPENCV_SOURCE_DIR"

git checkout 3.3.1 -b 3.3.1
mkdir -p build && cd build
cmake "$OPENCV_SOURCE_DIR" \
    -DCMAKE_INSTALL_PREFIX="/opt/opencv-3.3.1" \
    -DOPENCV_EXTRA_MODULES_PATH="$OPENCV_SOURCE_DIR/../opencv_contrib/modules"
