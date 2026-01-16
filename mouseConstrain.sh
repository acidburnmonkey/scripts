#!/bin/zsh

state="${HOME}/.local/state/togglemonitorlock"
mkdir -p "$(dirname ${state})"
booleanvalue="false"

if [[ -f ${state} ]]; then
    booleanvalue=$(cat ${state})
fi

if [[ ${booleanvalue} == "true" ]]; then
    # Mouse can reach DP-5 (normal position)
    hyprctl keyword monitor DP-2,3840x2160@60,-1920x-950,2
    echo "false" > ${state}
else
    # Mouse blocked - move DP-5 very far away
    hyprctl keyword monitor DP-2,3840x2160@60,50000x50000,2
    echo "true" > ${state}
fi
