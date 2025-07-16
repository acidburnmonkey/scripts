#!/usr/bin/env bash

# --- Configuration ---
# Virtualenv base
venv_base="$HOME/virtual/Envs"

# Projects map
declare -A projects
projects=(
  ["pajeet todo"]="$HOME/java_sc/todoApp/"
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
  chromium-browser "http://localhost:5173/" > /dev/null 2>&1 & disown
  firefox -p 'devfox'  > /dev/null 2>&1 & disown
  tmux new -s "$name" zsh -c "cd '$path'; exec zsh"

#python env selections
elif [[ $type == "venv" ]]; then
  venv_path="$venv_base/$name"
  tmux new -s "$name" zsh -c "source '$venv_path/bin/activate'; exec zsh"

else
  echo "Invalid selection."
fi

