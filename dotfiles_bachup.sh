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
# Rofi
"$HOME/.config/rofi/"
# GTK
"$HOME/.config/gtk*"
)

# directories on ~/.config
for source in "${list[@]}"; do
    cp -r -u -v $source $dotfiles
done

## data.txt
cp -r -u -v ~/scripts/data.txt "$dotfiles"


echo "All Done"
