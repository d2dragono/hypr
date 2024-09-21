#!/bin/bash

# LaunchMenu must have a menuEntries file and menu title as argument
if [ $# -lt 2 ] # 2 args ?
then
    echo "[FATAL]: No menuEntries file and/or menu title given."
    echo "Usage: launchMenu {path/to/menuEntries} {title}"
    exit 1;
fi

if [ ! -f $1 ] # Is it a regular file
then
    echo "[FATAL]: $1 is not a valid file."
    echo "Usage: launchMenu {path/to/menuEntries}"
    exit 1;
fi

# For ease of reading, renaming arguments
menuEntries=$1
title=$2

# Main
# As long as exit is not choosed, keep printing the menu
while true
do
    # Building menu everytime in case the user added an entry while the menu is launched already
    menu=(`./parseFile.sh $menuEntries`) || \
         { echo "[FATAL]: launchMenu: parseFile returned an error." && exit 1; }

    # Replacing _ with spaces
    for((i=0;i<${#menu[@]};i++))
    do
        menu[$i]=`echo ${menu[$i]} | sed 's/_/ /g'`
    done

    # Reading user choice
    answer=`whiptail --title "$2" --menu "Choose an option." 32 128 10 3>&1 1>&2 2>&3 "<== Back" "" "${menu[@]}"`

    # Replacing spaces with _
    answer=`echo $answer | sed 's/ /_/g'`

    # Launch associated script
    if [ "$answer" == "<==_Back" ]
    then
        exit 0
    else
        ./launchScript.sh $menuEntries $answer || \
        { echo "[FATAL]: launchScript: $answer entry returned an error." && exit 1; }
    fi
done