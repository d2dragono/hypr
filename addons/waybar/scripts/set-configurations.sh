#!/bin/bash

# Basically get current plugged in monitors, retreive the configuration for this set and turn on/off waybars depending of the retreived configuration

# Retreive plugged in monitor and format it to retreive the configuration
options=`$hyprPath/addons/waybar/scripts/pluggedMonitorList.sh | sed "s/ /,/g" | sed "s/:.//g"`

# Retreiving the saved status (on/off) of each monitor in the configuration
config=`$hyprPath/libs/filecfg $hyprPath/addons/waybar/configurations --get-option-all $options , =`

# Loading the configuration
for conf in `echo $config`
do
    monitor=`echo $conf | sed "s/=.*//"`
    value=`echo $conf | sed "s/.*=//"`

    if [ "$value" = "on" ]
    then
        sed -i "s/\(^.*\"output\": \)\".*\"/\1\"${monitor}\"/" $hyprPath/addons/waybar/waybars/$monitor/config.jsonc
    else
	sed -i "s/\(^.*\"output\": \)\".*\"/\1\"none\"/" $hyprPath/addons/waybar/waybars/$monitor/config.jsonc
    fi
done

exit 0
