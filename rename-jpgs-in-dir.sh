#!/bin/bash

#This program will rename all images in a directory from 1-200 + letter from a-z

dir="$HOME/photos/random/"
echo "Working on $dir"

# Function to check if a filename is numeric
is_numeric() {
  if [[ $1 =~ ^[0-9]+$ ]]; then
    return 0  # True
  else
    return 1  # False
  fi
}

counter=1

for file in "$dir"/*.jpg "$dir"/*.webp "$dir"/*.gif "$dir"/*.png "$dir"/*.jpeg; do
   if [ -f "$file" ]; then
        filename=$(basename "$file")
        extension="${file##*.}"
        
        if is_numeric "${filename%.*}"; then
            continue
        fi

        new_name="${counter}.${extension}"

        if [ -n "$new_name" ]; then
            if [ -e "$dir/$new_name" ]; then
                echo "Warning: File $new_name already exists. Skipping..."
            else
                mv "$file" "$dir/$new_name"
                ((counter++))
            fi
        else
            echo "Error: Unable to generate new name for $file. Skipping..."
        fi
    fi
done
