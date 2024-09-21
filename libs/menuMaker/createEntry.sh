#!/bin/bash
# Script to create an entry.
# The entry will either be added to an existing menuEntries file or
# will become the first entry of a brand new menuEntries file.

# Asking the user entry name
title=`whiptail --title "Create entry" --inputbox "Name of the new entry ?" 8 39 3>&1 1>&2 2>&3`
title=`echo "$title" | sed 's/ /_/g'`

# Asking the user entry description
desc=`whiptail --title "Create entry" --inputbox "Description of the new entry ?" 8 39 3>&1 1>&2 2>&3`
desc=`echo "$desc" | sed 's/ /_/g'`

# Asking the user path to script to launch
script=`whiptail --title "Create entry" --inputbox "Script to launch from this entry ?" 8 39 3>&1 1>&2 2>&3`

# Asking the user where to save this entry
saveAt=`whiptail --title "Create entry" --inputbox "Where to add this entry ?" 8 39 3>&1 1>&2 2>&3`

# Making the entry
echo "title=\"$title\" desc=\"$desc\" script=\"$script\"" >> "$saveAt"

# End
exit 0