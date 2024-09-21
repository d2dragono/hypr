#!/bin/bash

# Restoring dim
cat $hyprPath/addons/lock/saved-brightness.conf > /sys/class/backlight/intel_backlight/brightness

# Done
exit 0
