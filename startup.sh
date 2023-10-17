#!/bin/bash

sleep 5 
pkill openrgb

#poltit
exec nohup /usr/libexec/polkit-gnome-authentication-agent-1 &

#map caps to esc
setxkbmap -option "caps:escape"

#remove photoshop garbage files
rm ~/Photoshop_*.log 
rm ~/sniffer_*.log
rm ~/CEPHtmlEngine*
###############

