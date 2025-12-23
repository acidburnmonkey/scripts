#!/bin/bash

dotfiles="$HOME/repos/dotfiles/"

list=(
    "$HOME/.zshrc"                  # zsh config
    "$HOME/.p10k.zsh"               # powerlevel10k config
    "$HOME/.vimrc"                  # vim config
    "$HOME/.config/kitty"           # kitty terminal config
    "$HOME/.config/nvim"            # Neovim config
    "$HOME/.config/mpv/"            # mpv config
    "$HOME/.config/hypr/"           # Hyprland config
    "$HOME/.config/systemd/"        # systemd user services
    "$HOME/.config/waybar/"         # Waybar config
    "$HOME/.config/dunst/"          # Dunst config
    "$HOME/.config/ranger/"         # Ranger config
    "$HOME/.config/rofi/"           # Rofi config
    "$HOME/.config/fastfetch/"      # fastfetch
    "$HOME/.config/tmux/"           #tmux
    "$HOME/.config/sublime-text/"   #sublime-text
    "$HOME/.config/wezterm/"        # wezterm
    "$HOME/.config/ruff/"           # ruff
    "$HOME/.config/mimeapps.list"   # mimes
    "$HOME/.config/environment.d/"  # Auth
    "$HOME/.XCompose"               # Greek Symbols
)

case "$1" in

    --desktop)
        # directories on ~/.config
        for source in "${list[@]}"; do
            cp -r -u -v $source $dotfiles
        done

    ;;

    --laptop)

        cp -r -u -v  "$HOME/.config/hypr/" "$dotfiles/Laptop-configs/"
        cp -r -u -v  "$HOME/.config/waybar/" "$dotfiles/Laptop-configs/"
        cp -r -u -v  "$HOME/.config/hypr/" "$dotfiles/Laptop-configs/"

    ;;

    --retrive)

        echo "retrieving configs"
        rsync --info=progress2 -aAv --exclude={'hypr*','waybar','Laptop-configs','retired','.*', 'wrappedhl', 'README.md'} "$dotfiles" "$HOME/.config/"
        cp -r -u -v "$dotfiles/Laptop-configs/*" "$HOME/.config/"

    ;;

    *)
    echo "Chose an option --desktop --laptop --retrive"

esac

echo "All Done"
