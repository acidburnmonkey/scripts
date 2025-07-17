#!/bin/bash

## Remove the bloat
sudo apt purge redshift -y
sudo apt purge libreoffice-core -y
sudo apt purge libreoffice-common -y
sudo apt purge transmission-gtk -y
sudo apt purge hexchat -y
sudo apt purge baobab -y
sudo apt purge seahorse -y
sudo apt purge thunderbird -y
sudo apt purge rhythmbox -y
sudo apt purge pix -y
sudo apt purge simple-scan -y
sudo apt purge drawing -y
sudo apt purge gnote -y
sudo apt purge xreader -y
sudo apt purge onboard -y
sudo apt purge gnome-calendar -y
sudo apt purge celluloid -y
sudo apt purge gnome-logs -y
sudo apt purge gnome-power-manager -y
sudo apt purge onboard -y
sudo apt purge warpinator -y
sudo apt purge mintchat -y
sudo apt purge timeshift -y
sudo apt purge hypnotix -y


sudo apt autoremove -y && sudo apt clean
