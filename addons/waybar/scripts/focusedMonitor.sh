#!/bin/bash

# Script to retreive the monitor in which is currently the focused window

# 1 - Retreiving all monitors name and id using hyprctl monitors
# 2 - Retreiving focused window data using hyprctl activewindow, especially the monitor ID the window is displayed
# 3 - If the focused window monitor ID match one of the monitor list, we print the monitor name

# For each available monitors, looking for the one which ID match the focused window monitor ID
for monitorInfo in `$hyprPath/addons/waybar/scripts/pluggedMonitorList.sh`
do
    # Saving variables under understandables names
    focusedMonitorID=`hyprctl activewindow | grep 'monitor' | head -n 2 | tail -n 1 | sed "s/.*: //g"`
    monitorInfoName=`echo $monitorInfo | sed "s/:.*//g"`
    monitorInfoID=`echo $monitorInfo | sed "s/.*://g"`

    # Does the IDs match ?
    if [ $monitorInfoID -eq $focusedMonitorID ]
    then
        echo $monitorInfoName
        exit 0
    fi
done

# No monitor matching ?
echo "[ERROR]: Could not retreive the focused monitor."
exit 1

