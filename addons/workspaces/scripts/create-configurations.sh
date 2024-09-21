#!/bin/bash

# Update the workspace config :
# 1 - Create new configurations based on plugged in monitors
# Be default make the first monitor primary
# Done 

# 1 - Create new configuration based on plugged in monitors
# Retreiving plugged in monitors
monitors=`$hyprPath/addons/workspaces/scripts/pluggedMonitorList.sh | sed "s/:./,/g" | sed "s/ //g" | sed "s/,$//g"`
monitorsCount=(`$hyprPath/addons/workspaces/scripts/pluggedMonitorList.sh`)
# Creating the configuration (if not existing)
grep "${monitors}=" $hyprPath/addons/workspaces/configurations > /dev/null
if [ $? -ne 0 ] # i.e. does not exist
then
    newConf=`echo ${monitors}= | sed "s/,=/=/g"`
    for((i=0; i < ${#monitorsCount[@]}; i++))
    do
        newConf=${newConf}secondary,
    done
    # Removing last ,
    newConf=`echo $newConf | sed "s/,$//g"`
    # Making first monitor primary
    newConf=`echo $newConf | sed "s/=secondary,/=primary,/"`
    echo $newConf >> $hyprPath/addons/workspaces/configurations
fi

# Done
exit 0
