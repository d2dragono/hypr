#!/bin/bash
# Script to retreive monitors and launch each associated waybars.
# First retreiving each monitors
monitors=`$hyprPath/addons/waybar/scripts/pluggedMonitorList.sh | sed "s/:.//g"`
pkill waybar
for monitor in $monitors
do
    grep "\"output\": \"none\"" $hyprPath/addons/waybar/waybars/$monitors/config.jsonc > /dev/null

    if [ $? -ne 0 ]
    then
        waybar -c $hyprPath/addons/waybar/waybars/$monitor/config.jsonc -s $hyprPath/addons/waybar/waybars/$monitor/style.css &
    fi
done

exit 0
