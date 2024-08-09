#!/bin/bash

echo "Enter path to run"
read -r dir
echo "Working on $dir"

# Convert webp to png
for x in "$dir"/*.webp; do
  convert "$x" "${x%.webp}.png"
done

# Rename png files
find "$dir" -type f -name "*.webp.png" -exec rename 's/.webp.png/.png/' {} +

