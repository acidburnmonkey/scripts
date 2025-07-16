#!/bin/bash

# absolute path of directory
script_dir=$HOME/repos/icons/

icons=$script_dir/candy-icons
abs_sweet=$script_dir/Sweet-folders

# update icons
cd "$icons" && git pull
cd ..
rsync -a --exclude={'.git','.github','places'} candy-icons /usr/share/icons/


## get the sweet folders
cd  "$abs_sweet" && git pull
