#!/bin/bash
# Look for focused monitor and change the waybar border color of focused monitor to focused color and unfocused waybars to unfocused color
while [ 0 ]
do
    # Retreiving current theme focused and unfocused color
    activeBorderColor=`cat $HOME/.cache/wal/colors | head -n 8 | tail -n 1 | sed 's/#//g'`
    inactiveBorderColor=`cat $HOME/.cache/wal/colors | head -n 2 | tail -n 1 | sed 's/#//g'`

    # Getting current config and editing 'on' waybars colors
    focusedMonitor=`$hyprPath/addons/waybar/scripts/focusedMonitor.sh`

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
	    if [ "$monitor" = "$focusedMonitor" ]
	    then
                sed -i "s/    border-color:.*/    border-color:#${activeBorderColor};/g" $hyprPath/addons/waybar/waybars/$monitor/style.css
            else
	        sed -i "s/    border-color:.*/    border-color:#${inactiveBorderColor};/g" $hyprPath/addons/waybar/waybars/$monitor/style.css
	    fi
        fi
    done

    # Waiting x milliseconds
    sleep 0.1
done
