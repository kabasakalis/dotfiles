#!/bin/sh
echo Fixing compile_commands.json and moving it to project root 
# See caveat on windows: https://github.com/MaskRay/ccls/wiki/compile_commands.json
# We are assuming project root contains a build directory 
# Moving compile_commands.json from build directory to root.
# Modify if necessary to adapt to your project's structure
echo Directory: 
pwd
jq '[.[] | {directory: .directory, file: .file, arguments: .command | split(" ") | map(select(length > 0)) |
  map(sub("\\\\\""; "\""; "g"))}]' < compile_commands.json > temp.json && 
/usr/bin/rm compile_commands.json  &&
/usr/bin/mv temp.json ../compile_commands.json
