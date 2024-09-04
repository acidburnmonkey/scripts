#!/bin/bash

if pgrep mpv > /dev/null && [ -n "$1" ]; then
    pkill mpv
    mpv "$1"  

elif [ -n "$1" ] ; then # Checks if the first argument is non-empty
    mpv "$1"  

elif [ -z "$1" ]; then
    mpv --force-window --idle
fi

