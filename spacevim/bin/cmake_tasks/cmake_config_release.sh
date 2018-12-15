#!/bin/sh
echo cmake -G Ninja -DCMAKE_BUILD_TYPE=Release .. 
# cmake configure for release build
echo Directory: 
pwd
cmake -G Ninja -DCMAKE_BUILD_TYPE=Release ..
