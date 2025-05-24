#!/bin/bash

# --- Configuration ---
# Virtualenv base
venv_base="$HOME/virtual/Envs"

# Projects map
declare -A projects
projects=(
  ["currentProject"]="$HOME/java_sc/current"
  ["sideQuest"]="$HOME/java_sc/side"
  ["blogSite"]="$HOME/java_sc/blog"
)

# --- Build Selection List ---
choices=()

# Add projects
for name in "${!projects[@]}"; do
  choices+=("project: $name")
done

# Add virtualenvs
for v in "$venv_base"/*; do
  [[ -d $v ]] && choices+=("venv: $(basename "$v")")
done

# --- User selection via fzf ---
selected=$(printf "%s\n" "${choices[@]}" | fzf --prompt="Launch: ")

if [[ -z $selected ]]; then
  echo "Nothing selected."
  exit 0
fi

type="${selected%%:*}"
name="${selected#*: }"

# --- Handle Selection ---

#open webdeb
if [[ $type == "project" ]]; then
  path="${projects[$name]}"
  tmux new -s "$name" zsh -c "cd '$path'; exec zsh"
  chromium-browser "http://localhost:5173/" & disown
  # firefox "$path" & disown

#python env selections
elif [[ $type == "venv" ]]; then
  venv_path="$venv_base/$name"
  tmux new -s "$name" zsh -c "source '$venv_path/bin/activate'; exec zsh"

else
  echo "Invalid selection."
fi

