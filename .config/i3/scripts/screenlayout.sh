#!/bin/bash

screenleft="LVDS*"

for output in $(xrandr | grep '\Wconnected'| awk '{ print $1 }'); do
    if [[ $output =~ $screenleft ]] ; then
        left=$output
        echo "left = " $left
    fi
done

for output in $(xrandr | grep '\Wconnected' | awk '{ print $1 }'); do
    if [[ ! $output =~ $screenleft ]] ; then
        right=$output
        echo "right = " $right
    else echo "No other screen attached"
        right="False"
    fi
done


xrandr --output $left --primary --auto --pos 0x0 --rotate normal --output $right --right-of $left --rotate normal 
