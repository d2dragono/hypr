#!/bin/bash

# Basically get current plugged in monitors, retreive the configuration for this set and edit workspaces configuration

# Retreive plugged in monitor and format it to retreive the configuration
options=`$hyprPath/addons/workspaces/scripts/pluggedMonitorList.sh | sed "s/ /,/g" | sed "s/:.//g"`

# Retreiving the saved status (primary/secondary) of each monitor in the configuration
config=`$hyprPath/scripts/filectl $hyprPath/addons/workspaces/configurations --get-option-all $options , =`

# Loading the configuration
for conf in `echo $config`
do
    monitor=`echo $conf | sed "s/=.*//"`
    value=`echo $conf | sed "s/.*=//"`

    if [ "$value" = "primary" ]
    then
	    # Editing every workspace monitor appareance
	    sed -i "s/\(workspace = .\{1,2\}, monitor:\).*/\1${monitor}/g" $hyprPath/configs/hyprland/workspaces.conf
	    # In case new main monitor used to be secondary, removing its special workspace
	    sed -i "s/.*special:${monitor}-workspace.*//g" $hyprPath/configs/hyprland/workspaces.conf
    else
	# If not existing, adding the special workspace for this secondary monitor
	grep ".*special:${monitor}-workspace" $hyprPath/configs/hyprland/workspaces.conf >> /dev/null
	if [ ! $? -eq 0 ]
	then
	   echo "workspace = special:${monitor}-workspace, monitor:${monitor}" >> $hyprPath/configs/hyprland/workspaces.conf
	fi
    fi
done

# Remove empty lines
sed -i '/^[[:space:]]*$/d' $hyprPath/configs/hyprland/workspaces.conf

exit 0
