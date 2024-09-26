#!/bin/bash
grim -g "$(slurp)" - | wl-copy
dunstify "Screenshot of the region taken" -t 3000 -r 21
wl-paste | swappy -f - -o ~/Pictures/Screenshots/Screenshot-$(date +%F_%T | sed "s/://g" | sed "s/-//g")
dunstify "Screenshot saved or copied to clipboard successfully." -t 3000 -r 21


