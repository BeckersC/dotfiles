#!/bin/bash

#Variables
text = "Type password to unlock"
effect=(-filter Gaussian -resize 20% -define "filter:sigma=1.5" -resize 500,5%)
image=$(mktemp --suffix=.png)
trap 'rm -f "$image"' EXIT
$image=scrot 
convert $image -scale 10% -filter Gaussian -define "filter:sigma=1.5" -scale 1000% $image

i3lock -u -i $TMPBG
