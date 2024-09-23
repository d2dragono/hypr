#!/bin/bash
# If the computer is turned off while caffeine is on, we set caffeine at off at hyprland boot by default
sed -i "s/^status=.*/status=off/g" $hyprPath/addons/caffeine/status.conf
exit 0
