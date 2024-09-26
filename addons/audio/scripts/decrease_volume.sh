#!/bin/bash
# Editing volume and saving it
amixer set Master 5%-;
alsactl --file $hyprPath/addons/audio/asound.state store

# Notifying the volume edit
$hyprPath/addons/audio/scripts/notifier.sh 
