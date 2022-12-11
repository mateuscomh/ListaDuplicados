#!/bin/bash

echo "Enter the path to the folder you want to search:"
read folder
echo "Finding duplicated files in $folder..."

#duplicates=$(find "$folder" -type f -exec md5sum {} + | sort | uniq -w 32 -d | awk '{print $2}')
duplicates=$(find "$folder" -type f -exec md5sum '{}' \; | sort | uniq -Dw 32)

if [ -z "$duplicates" ]
then
    echo "No duplicated files found in $folder."
else
    echo "The following duplicated files were found in $folder:"
    echo "$duplicates"
fi
