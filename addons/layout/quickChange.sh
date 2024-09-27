#!/bin/bash
grep ".*kb_variant = us" $hyprPath/config/inputs.conf > /dev/null

if [ $? -eq 0 ]
then
    sed -i "s/\(.*kb_variant = \).*/\1/" $hyprPath/config/inputs.conf
    dunstify "New layout: AZERTY" -t 3000 -r 29 --icon $hyprPath/addons/layout/keyboard.icon
else
    sed -i "s/\(.*kb_variant = \)/\1us/" $hyprPath/config/inputs.conf
    dunstify "New layout: QWERTY" -t 3000 -r 29 --icon $hyprPath/addons/layout/keyboard.icon
fi

# Success
exit 0
