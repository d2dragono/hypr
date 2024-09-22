#!/bin/bash
if [ "$1" = "error" ]
then
    >&2 echo "[ERROR]: An error occured. Cannot proceed further."
    exit 1
else
    echo "Success!"
    exit 0
fi
