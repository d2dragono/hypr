#!/bin/bash

# Update the waybar config :
# 1 - Create new configurations based on plugged in monitors
# 2 - Refresh monitors subfolders
# Done 

# 1 - Create new configuration based on plugged in monitors
# Retreiving plugged in monitors
monitors=`$hyprPath/addons/waybar/scripts/pluggedMonitorList.sh | sed "s/:./,/g" | sed "s/ //g" | sed "s/,$//g"`
monitorsCount=(`$hyprPath/addons/waybar/scripts/pluggedMonitorList.sh`)
# Creating the configuration (if not existing)
grep "${monitors}=" $hyprPath/addons/waybar/configurations > /dev/null
if [ $? -ne 0 ] # i.e. does not exist
then
    newConf=`echo ${monitors}= | sed "s/,=/=/g"`
    for((i=0; i < ${#monitorsCount[@]}; i++))
    do
        newConf=${newConf}on,
    done
    # Removing last ,
    newConf=`echo $newConf | sed "s/,$//g"`
    echo $newConf >> $hyprPath/addons/waybar/configurations
fi

# 2 - Refresh monitors subfolders
for monitor in `echo $monitors | sed "s/,/ /g"`
do
    if [ ! -d $hyprPath/addons/waybar/waybars/$monitor ]
    then
	mkdir $hyprPath/addons/waybar/waybars/$monitor
    fi

    cp -f $hyprPath/addons/waybar/templates/config.jsonc $hyprPath/addons/waybar/waybars/$monitor/
    cp -f $hyprPath/addons/waybar/templates/style.css $hyprPath/addons/waybar/waybars/$monitor/
done

# Launching set configuration to update the templates
$hyprPath/addons/waybar/scripts/set-configurations.sh

# Done
exit 0
