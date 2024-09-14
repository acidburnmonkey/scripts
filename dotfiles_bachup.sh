#!/bin/bash

dotfiles="$HOME/repos/dotfiles/"

list=(
    "$HOME/.zshrc"            # zsh config
    "$HOME/.p10k.zsh"         # powerlevel10k config
    "$HOME/.config/kitty"     # kitty terminal config
    "$HOME/.config/ulauncher" # ulauncher config
    "$HOME/.config/neofetch"  # neofetch config
    "$HOME/.config/nvim"      # Neovim config
    "$HOME/.config/mpv/"      # mpv config
    "$HOME/.vimrc"            # vim config
    "$HOME/.config/hypr/"     # Hyprland config
    "$HOME/.config/systemd/"  # systemd user services
    "$HOME/.config/waybar/"   # Waybar config
    "$HOME/.config/dunst/"    # Dunst config
    "$HOME/.config/ranger/"   # Ranger config
    "$HOME/.config/rofi/"     # Rofi config
    "$HOME/.config/gtk*"      # GTK configs
)

case "$1" in 

    --desktop)
        # directories on ~/.config
        for source in "${list[@]}"; do
            cp -r -u -v $source $dotfiles
        done

        ## data.txt
        cp -r -u -v ~/scripts/data.txt "$dotfiles"

    ;;

    --laptop)

        cp -r -u -v  "$HOME/.config/hypr/" "$dotfiles/Laptop-configs/"
        cp -r -u -v  "$HOME/.config/waybar/" "$dotfiles/Laptop-configs/"

    ;;

    --retrive)

        echo "retriving configs"
        rsync --info=progress2 -aAv --exclude={'hypr','waybar','Laptop-configs','retired'} "$dotfiles" "$HOME/.config/"
        cp -r -u -v "$dotfiles/Laptop-configs/*" "$HOME/.config/"

    ;;
    
    *) 
    echo "Chose an option --desktop --laptop --retrive"

esac
    
echo "All Done"
