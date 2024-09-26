#!/bin/bash
# Notifying the brightness
# Getting the brightness %
percentage=$(($(cat /sys/class/backlight/intel_backlight/brightness) * 100 / 400))
dunstify "Brightness: $percentage%" -t 3000 -h int:value:$percentage -r 35
exit 0
