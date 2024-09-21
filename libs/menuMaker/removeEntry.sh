#!/bin/bash
# Script to quickly remove an entry from a menuEntries file

# Asking user path to a menu entry file
path=`whiptail --title "Path to menuEntries" --inputbox "What is the path to the menuEntries file in which you want to remove an entry ?" 9 45 3>&1 1>&2 2>&3`

# Using whiptail checklist option to select multiples entries to remove
menu=(`./parseFile.sh $path off`) || \
     { echo "[FATAL]: removeEntry: parseFile returned an error." && exit 1; }

# Replacing _ with spaces
for((i=0;i<${#menu[@]};i++))
do
    menu[$i]=`echo ${menu[$i]} | sed 's/_/ /g'`
done

answer=`whiptail --title "Remove entries" --checklist "Choose an option." 32 128 10 3>&1 1>&2 2>&3 "${menu[@]}"`

# Replacing spaces with _
answer=`echo $answer | sed 's/ /_/g'`

# We must "format" the answer
formattedAnswer=`echo $answer | sed 's/"//g'`

# Removing the selected entries from the given file
while IFS= read -r line
do
    for entry in $formattedAnswer
    do
        # Do we find title=$entry. If so, we remove the line
        echo "$line" | grep "title=\"$entry\"" > /dev/null # We are interested in the exit status
        if [ $? -eq 0 ] # If the line contains the researched entry
        then
            sed -i "/title=\"${entry}\".*/d" $path
            break;
        fi
    done
done < "$path"