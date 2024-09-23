#!/bin/bash
# To suspend hypridle
status=`$hyprPath/libs/filecfg $hyprPath/addons/caffeine/status.conf --get-option status =`
if [ "$status" = "off" ]
then
    pkill hypridle
    $hyprPath/libs/filecfg $hyprPath/addons/caffeine/status.conf --set-option status = on
    $notif "Caffeine has been turned on." -t 3000
else
    hypridle -c $hyprPath/addons/timeout/hypridle-timeout-countdown.conf &
    $hyprPath/libs/filecfg $hyprPath/addons/caffeine/status.conf --set-option status = off
    $notif "Caffeine has been turned off." -t 3000
fi
