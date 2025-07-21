#!/usr/bin/env bash

# --- Configuration ---

# Python projects
declare -A uvprojects
uvprojects=(
)

# Regular projects
declare -A projects
projects=(
  ["pajeet todo"]="$HOME/java_sc/todoApp/"
)

# --- Build selection list ---
choices=()

for name in "${!projects[@]}"; do
  choices+=("project:$name")
done

for name in "${!uvprojects[@]}"; do
  choices+=("uvproject:$name")
done

# --- User selection via fzf ---
selected=$(printf "%s\n" "${choices[@]}" | fzf --prompt="Launch: ") || exit 1
if [[ -z $selected ]]; then
  echo "Nothing selected."
  exit 0
fi

# --- Parse selection ---
type="${selected%%:*}"
name="${selected#*:}"

case "$type" in
  project)

    cd "${projects[$name]}" || exit
    path="${projects[$name]}"
    chromium-browser "http://localhost:5173/" > /dev/null 2>&1 & disown
    firefox -p 'devfox'  > /dev/null 2>&1 & disown
    tmux new -s "$name" zsh -c "cd '$path'; exec zsh"

    ;;
  uvproject)

    cd "${uvprojects[$name]}" || exit
    venv_path="$venv_base/$name"
    tmux new -s "$name" zsh -c "source '$venv_path/bin/activate'; exec zsh"

    ;;
  *)
    echo "Invalid selection"
    exit 1
    ;;
esac


#open webdeb
if [[ $type == "project" ]]; then
  path="${projects[$name]}"
  chromium-browser "http://localhost:5173/" > /dev/null 2>&1 & disown
  firefox -p 'devfox'  > /dev/null 2>&1 & disown
  tmux new -s "$name" zsh -c "cd '$path'; exec zsh"




