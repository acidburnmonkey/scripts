#!/bin/bash

SOCKET="/tmp/mpv-socket"

# Function to start mpv with IPC
start_mpv() {
    mpv --input-ipc-server="$SOCKET" "$@" &
    sleep 0.5
}

if [ -S "$SOCKET" ] && ! pgrep -x mpv > /dev/null; then
    rm -f "$SOCKET"
fi

if [ -n "$1" ]; then
    if pgrep -x mpv > /dev/null && [ -S "$SOCKET" ]; then
        if echo "loadfile \"$(realpath "$1")\" replace" | socat - "$SOCKET" 2>/dev/null; then
            exit 0
        fi
    fi

    if pgrep -x mpv > /dev/null; then
        pkill -x mpv
        sleep 0.5
        rm -f "$SOCKET"
    fi
    start_mpv "$1"
else
    if ! pgrep -x mpv > /dev/null; then
        start_mpv --force-window --idle
    fi
fi
