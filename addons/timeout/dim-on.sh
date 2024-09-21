#!/bin/bash

# Divide the current brightness by 2 if above 50
# Save the current brightness to load it back when user move

# Saving current brightness to restore it post dim
cat /sys/class/backlight/intel_backlight/brightness > $hyprPath/addons/timeout/saved-brightness.conf

# Dimming
current=`cat /sys/class/backlight/intel_backlight/brightness`
if [ $current -gt 50 ]
then
    echo $(($(cat /sys/class/backlight/intel_backlight/brightness) / 4)) > /sys/class/backlight/intel_backlight/brightness
else
    echo $(($(cat /sys/class/backlight/intel_backlight/brightness) / 2)) > /sys/class/backlight/intel_backlight/brightness
fi

# Done
exit 0
