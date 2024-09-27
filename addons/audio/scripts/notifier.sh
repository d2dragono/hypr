#!/bin/bash
# Notifying the volume
# Getting the volume %
percentage=`amixer get Master | grep "Left.*%" | cut -d" " -f7 | sed "s/\[\(.*\)\%]/\1/"`
# Is the sound muted ?
status=`amixer get Master | grep "Left.*%" | cut -d" " -f8 | sed "s/\[\(.*\)\]/\1/"`
if [ "$status" = "on" ]
then
    printStatus=""
else
    printStatus="(Muted)"
fi

dunstify "Volume: $percentage% $printStatus" -t 3000 -h int:value:$percentage -r 34 --icon $hyprPath/addons/audio/scripts/volume.icon
exit 0
