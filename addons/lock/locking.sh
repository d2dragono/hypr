#!/bin/bash

# Script than launch hyprlock and launch a second instance of hypridle to dim the screen when the user is inactive on the locking screen
pkill hypridle # Killing timeout hypridles

# Launching lock screen hypridle
hypridle -c $hyprPath/addons/lock/hypridle-lock-countdown.conf &

# Saving saved-brightness from timeout to lock's saved-brightness
cat $hyprPath/addons/timeout/saved-brightness.conf > $hyprPath/addons/lock/saved-brightness.conf

# Locking screen
hyprlock -c $hyprPath/addons/lock/hyprlock.conf

# Screen unlocked, killing lock screen hypridle
pkill hypridle

# Restauring pre-dim timeout brightness
$hyprPath/addons/timeout/dim-off.sh

# Launching timeout hypridle
hypridle -c $hyprPath/addons/timeout/hypridle-timeout-countdown.conf

# Done
exit 0
