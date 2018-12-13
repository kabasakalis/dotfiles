#!/bin/sh
echo cmake -G Ninja -DCMAKE_BUILD_TYPE=Release .. 
# Configure with cmake for Release build
echo Directory: 
pwd
cmake -G Ninja -DCMAKE_BUILD_TYPE=Release ..
