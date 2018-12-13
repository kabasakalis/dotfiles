#!/bin/sh
echo Configuring for degug build 
echo cmake -G Ninja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Debug .. \&\& compile_commands_fix.sh
# Configure with cmake for Debug build, and fix  compile_commands.json
echo Directory: 
pwd
cmake -G Ninja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Debug .. && ../bin/compile_commands_fix.sh
