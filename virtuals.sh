#!/bin/bash

# Define the base directory
hev="$HOME/virtual/Envs/"

# Collect all directories into an array
dir_list=("$hev"*/)

# Pass the array to fzf for selection
selected=$(printf "%s\n" "${dir_list[@]}" | fzf)

if [[ -n $selected ]]; then

    # Print the selected directory
    echo "You selected: $selected"

    # Remove the trailing slash and activate the selected environment
    selected_venv="${selected%/}"

    dir_name=$(basename "$selected_venv")
    tmux new -s "$dir_name" zsh -c "source '$selected_venv/bin/activate'; exec zsh"

else
    echo "You selected None"
fi
