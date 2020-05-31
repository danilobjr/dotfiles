#!/bin/bash

brightness=$(xrandr --prop --verbose | grep Brightness | awk '{ print $2 }')
percentage=$(echo "$brightness * 100" | bc -l)
percentage=$(echo "$percentage/1" | bc)
echo "$percentage%"
