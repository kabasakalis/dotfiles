#!/bin/sh
echo Configuring for degug build 
echo cmake -G Ninja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Debug .. \&\& ../tasks/compile_commands_fix.sh
# cmake configure for debug build, and fix  compile_commands.json
echo Directory: 
pwd
cmake -G Ninja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Debug .. && ../tasks/compile_commands_fix.sh
