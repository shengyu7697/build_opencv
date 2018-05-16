#!/bin/bash

OPENCV_SOURCE_DIR="/home/xxx/xxx/github/opencv"
# OPENCV_SOURCE_DIR
# |- opencv
# |- opencv_contrib

clean_opecv() {
	echo "[LOG] clean_opecv ..."
	cd "$1" && \
	git checkout master && \
	git br -D 3.3.1 && \
	cd -

	rm -rf build
}

run_cmake_opencv() {
	echo "[LOG] run_cmake_opencv ..."
	#./unix_build_3.3.1.sh "$1"
	./unix_build_3.3.1_with_contrib.sh "$1"

	cat build/CMakeCache.txt | grep OPENCV_EXTRA_MODULES_PATH
}

build_opencv() {
	echo "[LOG] build_opencv ..."
	cd "$1" && \
	make -j4
}

install_opencv() {
	echo "[LOG] install_opencv ..."
	cd "$1" && \
	sudo make install
}

clean_build_opencv() {
	clean_opecv "$1"

	run_cmake_opencv "$1"
}

clean_build_opencv "$OPENCV_SOURCE_DIR"

echo "[LOG] use cmake-gui ? => cd build && cmake-gui $OPENCV_SOURCE_DIR"
