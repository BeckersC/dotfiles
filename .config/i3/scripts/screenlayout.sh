#!/bin/bash

#for output in $(xrandr | grep "\Wconnected" | awk "{print $1}"); do
#    if [[$output=~ HDMI*$ ]]; then
#        hdmi=$output
#    fi
#done

screenleft="DVI"
screenright="HDMI"

for output in $(xrandr | grep '\Wconnected' | awk '{ print $1 }'); do
    if [[ $output =~ screenleft ]]; then
            hdmi=$output
    fi
done

echo $lvds
