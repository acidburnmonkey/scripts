#!/bin/bash


#zhrc
cp -r -u -v ~/.zshrc ~/repos/dotfiles
#kitty
cp -r -u -v ~/.config/kitty ~/repos/dotfiles
#ulauncher
cp -r -u -v ~/.config/ulauncher ~/repos/dotfiles
#neofetch
cp -r -u -v ~/.config/neofetch ~/repos/dotfiles
# Cinnamon configs
cp -r -u -v ~/cinnamon-configs ~/repos/dotfiles
# Nvim
cp -r -u -v ~/.config/nvim ~/repos/dotfiles
#desktop ---------
#i3 
cp -r -u -v ~/.config/i3 ~/repos/dotfiles/desktop/
#polybar
cp -r -u -v ~/.config/polybar ~/repos/dotfiles/desktop/
#picom
cp -r -u -v ~/.config/picom.conf ~/repos/dotfiles/picom.conf



echo "All Done"
