#!/bin/bash

# absulute path of directory
script_dir=$HOME/repos/icons/

icons=$script_dir/candy-icons
abs_sweet=$script_dir/Sweet-folders
folders=$script_dir/Sweet-folders/Sweet-Purple/

# update icons
cd "$icons" && git pull
cd ..
cp -r candy-icons /usr/share/icons/

## get the sweet folders 
cd  "$abs_sweet" && git pull
cp -r "$folders/16/" /usr/share/icons/candy-icons/places/
cp -r "$folders/Places/." /usr/share/icons/candy-icons/places/48/
