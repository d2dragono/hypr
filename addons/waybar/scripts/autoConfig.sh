#!/bin/bash
# Load once current monitor setup and save it.
# We check every x seconds for the current monitor configuration and if it is another one, we reload the configuration

# Loading conf
$hyprPath/addons/waybar/scripts/create-configurations.sh
$hyprPath/addons/waybar/scripts/set-configurations.sh
$hyprPath/addons/waybar/scripts/launch-configurations.sh
current=`$hyprPath/addons/waybar/scripts/pluggedMonitorList.sh | sed "s/:.//g"`
sleep 10

# Refreshing conf every 10 seconds
while [ 0 ]
do
    getConf=`$hyprPath/addons/waybar/scripts/pluggedMonitorList.sh | sed "s/:.//g"`
    if [ ! "$getConf" = "$current" ]
    then
        $hyprPath/addons/waybar/scripts/create-configurations.sh
        $hyprPath/addons/waybar/scripts/set-configurations.sh
        $hyprPath/addons/waybar/scripts/launch-configurations.sh
        current=`$hyprPath/addons/waybar/scripts/pluggedMonitorList.sh | sed "s/:.//g"`
    fi
    sleep 10
done
exit 0
