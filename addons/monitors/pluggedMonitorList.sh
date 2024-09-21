#!/bin/bash
echo `hyprctl monitors | grep 'Monitor' | sed "s/Monitor //g" | sed "s/ (ID /:/g" | sed "s/)://g"`
