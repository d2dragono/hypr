#!/bin/bash

# Divide the current brightness by 2 if above 50
# Save the current brightness to load it back when user move

# We only dim if the screen is not already dimmed by timeout dimming
# We compare current brightness with the one saved in timeout/saved-brightness.conf
saved=`cat /home/$USER/Hyprland/addons/timeout/saved-brightness.conf`
current=`cat /sys/class/backlight/intel_backlight/brightness`

if [ $saved -eq $current ]
then
    # Not dimmed, so we dim
    # Saving current brightness to restore it post dim
    cat /sys/class/backlight/intel_backlight/brightness > $hyprPath/addons/lock/saved-brightness.conf

    current=`cat /sys/class/backlight/intel_backlight/brightness`
    if [ $current -gt 50 ]
    then
	echo $(($(cat /sys/class/backlight/intel_backlight/brightness) / 4)) > /sys/class/backlight/intel_backlight/brightness
    else
	echo $(($(cat /sys/class/backlight/intel_backlight/brightness) / 2)) > /sys/class/backlight/intel_backlight/brightness
    fi
fi

# Done
exit 0
