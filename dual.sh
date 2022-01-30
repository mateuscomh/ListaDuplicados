#!/bin/bash 
[[ -d $1 ]] || exit 1

find $1 -maxdepth $4 -type -f -exec md5sum '{}' \; | sort | uniq -Dw 32 
