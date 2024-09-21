#!/bin/bash
# Simple script use to launch the correct script from a menuEntries file

# LaunchScript must have a menuEntries file as first argument
# and an entry name as second argument
if [ $# -lt 2 ] # 2 args ?
then
    echo "[FATAL]: No menuEntries file and/or entry name given."
    echo "Usage: launchScript {path/to/menuEntries} {entry}"
    exit 1;
fi

if [ ! -f $1 ] # Is $1 a regular file ?
then
    echo "[FATAL]: $1 is not a valid file."
    echo "Usage: launchScript {path/to/menuEntries} {entry}"
    exit 1;
fi

# For ease of reading, renaming arguments
menuEntries=$1
entry=$2

# Main
while IFS= read -r line
do
    echo "$line" | grep $entry > /dev/null # We are interested in the exit status
    if [ $? -eq 0 ] # If the line contains the researched entry
    then
        scriptPath=`echo $line | sed "s/title=\"\${entry}\".*script=\"\(.*\)\"/\1/"`
        $scriptPath # Will launch the script
        exit 0
    fi
done < "$menuEntries"