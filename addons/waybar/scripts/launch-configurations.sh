#!/bin/bash
# Script to retreive monitors and launch each associated waybars.
# First retreiving each monitors
monitors=`$hyprPath/addons/waybar/scripts/pluggedMonitorList.sh | sed "s/:.//g"`
pkill waybar
for monitor in $monitors
do
    waybar -c $hyprPath/addons/waybar/waybars/$monitor/config.jsonc -s $hyprPath/addons/waybar/waybars/$monitor/style.css &
done

exit 0
