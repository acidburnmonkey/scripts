#!/bin/bash

#This program will rename all images in a directory from 1-200 + letter from a-z

max_range=200
counter=1
letter_counter=97 #AcII for a
dir="/media/toxic/photos/random/"

echo "Working on $dir"

for file in "$dir"/*.jpg "$dir"/*.png "$dir"/*.jpeg; do
 if [ -f "$file" ]; then
        extension="${file##*.}"
        letter=$(printf \\$(printf '%03o' "$letter_counter"))  # Convert ASCII to character
        new_name="${counter}${letter}.${extension}"
        mv "$file" "$dir/$new_name"
        ((counter++))
        if ((counter > max_range)); then
            counter=1
            ((letter_counter++))
        fi
    fi
done 

