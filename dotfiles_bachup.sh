#!/bin/bash

dotfiles="$HOME/repos/dotfiles/"

list=(
#zhrc
" $HOME/.zshrc"
#.p10k.zh
" $HOME/.p10k.zsh"
#kitty
"$HOME/.config/kitty "
#ulauncher
"$HOME/.config/ulauncher"
#neofetch
"$HOME/.config/neofetch"
# Nvim
"$HOME/.config/nvim "
# mpv
"$HOME/.config/mpv/"
#vimrc
"$HOME/.vimrc"
#hyprland
"$HOME/.config/hypr/"
#systemd user
"$HOME/.config/systemd/"
#waybar
"$HOME/.config/waybar/"
# dunst
"$HOME/.config/dunst/"
# Ranger
"$HOME/.config/ranger/"
)

# directories on ~/.config
for source in "${list[@]}"; do
    cp -r -u -v $source $dotfiles
done

## data.txt
cp -r -u -v ~/scripts/data.txt "$dotfiles"

#desktop ---------
#i3 
cp -r -u -v ~/.config/i3 ~/repos/dotfiles/desktop/
#polybar
cp -r -u -v ~/.config/polybar ~/repos/dotfiles/desktop/
#picom
cp -r -u -v ~/.config/picom.conf ~/repos/dotfiles/picom.conf


##zhrc
#cp -r -u -v ~/.zshrc  $dotfiles
##.p10k.zh
#cp -r -u -v ~/.p10k.zsh $dotfiles
##kitty
#cp -r -u -v ~/.config/kitty $dotfiles
##ulauncher
#cp -r -u -v ~/.config/ulauncher $dotfiles
##neofetch
#cp -r -u -v ~/.config/neofetch $dotfiles
## Nvim
#cp -r -u -v ~/.config/nvim $dotfiles
## mpv
#cp -r -u -v ~/.config/mpv/ $dotfiles

#cp -r -u -v ~/.vimrc $dotfiles




echo "All Done"
