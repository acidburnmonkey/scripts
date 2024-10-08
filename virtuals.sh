#!/bin/bash

# Define the base directory
hev="$HOME/virtual/Envs/"

# Collect all directories into an array
dir_list=("$hev"*/)

# Pass the array to fzf for selection
selected=$(printf "%s\n" "${dir_list[@]}" | fzf)

# Print the selected directory
echo "You selected: $selected"

# Remove the trailing slash and activate the selected environment
selected_venv="${selected%/}"
source "$selected_venv/bin/activate"
