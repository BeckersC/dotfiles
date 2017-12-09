#!/bin/bash

screenleft="HDMI*"
orientation="left"
offset="400"

left="LVDS-1"
for output in $(xrandr | grep '\Wconnected'| awk '{ print $1 }'); do
    if [[ $output =~ $screenleft ]] ; then
        left=$output
        echo "left = " $left
    fi
done

right="left"
for output in $(xrandr | grep '\Wconnected' | awk '{ print $1 }'); do
    if [[ ! $output =~ $screenleft ]] ; then
        right=$output
        echo "right = " $right
    fi
done

config_file=~/.config/i3/config.d/0_Screens
rm $config_file
touch $config_file
echo '#Screen Variables' >> $config_file
echo 'set $screen1' $right >> $config_file
echo 'set $screen2' $left >> $config_file
echo '' >> $config_file

echo xrandr --output $left --primary --auto --pos 0x0 --rotate $orientation --output $right --auto --right-of $left --rotate normal 
xrandr --output $left --primary --auto --pos 0x0 --rotate $orientation --output $right --auto --right-of $left --rotate normal 
