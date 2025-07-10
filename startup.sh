#!/bin/bash

sleep 5
pkill openrgb

eval $(ssh-agent) > /dev/null 2>&1

#Scale xwayland up
# echo "Xft.dpi: 192" | xrdb -merge

##poltit
# exec nohup /usr/libexec/polkit-gnome-authentication-agent-1 &
