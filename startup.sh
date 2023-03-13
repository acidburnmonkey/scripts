#!/bin/bash

sleep 2 
pkill openrgb

#poltit
exec nohup /usr/libexec/polkit-gnome-authentication-agent-1 &

#remove photoshop garbage files
rm ~/Photoshop_*.log 
rm ~/sniffer_*.log
rm ~/CEPHtmlEngine*
###############

