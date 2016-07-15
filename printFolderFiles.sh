#!/bin/sh
# Author : Harshit Gupta, mercury200Hg@gmail.com
# Script to print all files in a folder - mercury200Hg@gmail.com
# It uses default settings of default printer

# Usage : ./printFolderFiles.sh ~/myFolder

inputFolder=$1

for i in "$inputFolder"*
do
    echo $i | while read f; do
    VAR="$VAR:$f"
    echo $f
    lp < $f;
    done
done
