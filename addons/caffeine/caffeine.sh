#!/bin/bash
# To suspend hypridle
status=`$hyprPath/libs/filecfg $hyprPath/addons/caffeine/status.conf --get-option status =`
if [ "$status" = "off" ]
then
    pkill hypridle
    $hyprPath/libs/filecfg $hyprPath/addons/caffeine/status.conf --set-option status = on
    dunstify "Caffeine has been turned on." -t 3000 -r 33 --icon $hyprPath/addons/caffeine/coffee.icon
    for monitor in `$hyprPath/addons/caffeine/getWaybarsOn.sh`
    do
        sed -i "s/\(.*\/\* caffeine \*\/ color:\).*/\1green/g" $hyprPath/addons/waybar/waybars/$monitor/style.css
    done
else
    hypridle -c $hyprPath/addons/timeout/hypridle-timeout-countdown.conf &
    $hyprPath/libs/filecfg $hyprPath/addons/caffeine/status.conf --set-option status = off
    dunstify "Caffeine has been turned off." -t 3000 -r 33 --icon $hyprPath/addons/caffeine/coffee.icon
    for monitor in `$hyprPath/addons/caffeine/getWaybarsOn.sh`
    do
        sed -i "s/\(.*\/\* caffeine \*\/ color:\).*/\1white/g" $hyprPath/addons/waybar/waybars/$monitor/style.css
    done

fi
