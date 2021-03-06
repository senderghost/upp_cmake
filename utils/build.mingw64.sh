#!/bin/bash
START=$(date +%s.%N)
BUILD_DIR="build.mingw64"

if [ -d $BUILD_DIR ]; then
    rm -rf $BUILD_DIR
fi

mkdir -p $BUILD_DIR

cd $BUILD_DIR
cmake -DCMAKE_TOOLCHAIN_FILE=../toolchain-mingw64.cmake .. && make -j 4

DUR=$(echo "$(date +%s.%N) - ${START}" | bc)
echo "Execution time: $(date -d@0${DUR} -u +%H:%M:%S.%N)"
