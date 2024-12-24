#!/bin/bash

# absulute path of directory
script_dir=$HOME/repos/icons/

icons=$script_dir/candy-icons
abs_sweet=$script_dir/Sweet-folders
folders=$script_dir/Sweet-folders/Sweet-Blue/

# update icons
cd "$icons" && git pull
cd ..
rsync -a --exclude='.git' candy-icons /usr/share/icons/

## get the sweet folders 
cd  "$abs_sweet" && git pull
cp -r -u "$folders/16/" /usr/share/icons/candy-icons/places/
cp -r -u "$folders/Places/." /usr/share/icons/candy-icons/places/48/
