#!/bin/bash
cat $hyprPath/addons/lock/saved-brightness.conf > /sys/class/backlight/intel_backlight/brightness
