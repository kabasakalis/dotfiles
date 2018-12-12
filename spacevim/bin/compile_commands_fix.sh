#!/bin/sh
echo Fixing compile_commands.json   # See caveat on windows: https://github.com/MaskRay/ccls/wiki/compile_commands.json
echo Directory: 
pwd
jq '[.[] | {directory: .directory, file: .file, arguments: .command | split(" ") | map(select(length > 0)) |
  map(sub("\\\\\""; "\""; "g"))}]' < compile_commands.json > temp.json && 
/usr/bin/rm compile_commands.json  && 
/usr/bin/mv temp.json compile_commands.json
