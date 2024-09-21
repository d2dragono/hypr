#!/bin/bash
# Extract title and description from a menuEntries file

# parseFile must have a menuEntries file as argument
if [ $# -lt 1 ] # Is there an argument
then
    echo "[FATAL]: No menuEntries file given."
    echo "Usage: parseFile {path/to/menuEntries}"
    exit 1;
fi

if [ ! -f $1 ] # Is it a regular file
then
    echo "[FATAL]: $1 is not a valid file."
    echo "Usage: parseFile {path/to/menuEntries}"
    exit 1;
fi

# parseFile support a second argument, which is a string added at the end of every entry.
# usage example : adding "off" or "on" at the end of every line to use it for whiptail checkmenu
if [ $# -gt 1 ]
then
    second=" $2 "
else
    second=""
fi

# For ease of reading, renaming arguments
menuEntries=$1

# Main
while IFS= read -r line
do
    title=`echo -e $line | sed 's/title="\(.*\)" desc.*/\1/'`
    echo -n "$title "

    desc=`echo -e $line | sed 's/title.* desc="\(.*\)" script.*/\1/'`
    echo "$desc$second"

done < "$menuEntries"

exit 0