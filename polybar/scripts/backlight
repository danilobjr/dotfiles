#!/bin/bash

brightness=$(xrandr --prop --verbose | grep Brightness | awk '{ print $2 }')
fill=$(echo "$brightness * 10" | bc -l)
fill=$(echo "$fill/1" | bc)
empty=$((9-$fill))

fill=$(seq -s '' 0 $(($fill-1)) | sed 's/.//g')
empty=$(seq -s '' 0 $empty | sed 's/.//g')

echo "$fill%{F#4c566a}$empty%{F-}"
