#!/usr/bin/bash
echo "==============================="
echo "0. This script can only use on Linux which installed nvidia official driver and optirun command."
echo "1. To fix input method,read this:https://www.mcbbs.net/thread-728252-1-4.html"
echo "==============================="

# If you have installed nvidia driver and optirun.
optirun java -jar HMCL.jar
# ELSE
#java -jar HMCL.jar

# AMD GPU should also have some way to run minecraft on gpu.
