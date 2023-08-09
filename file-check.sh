#!/usr/local/bin/bash

# file check
# /Users/vivabm/Temp
# /Users/vivabm/Temp/listview.PNG

file=$1
if [ -f $file ]; then
    echo "$file is a regular file"
elif [ -L $file ]; then
    echo "$file is a soft link"
elif [ -d $file ]; then
    echo "$file is a directory"
else
    echo "$file does not exit"
fi



