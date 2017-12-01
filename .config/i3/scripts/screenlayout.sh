#!/bin/bash

screenleft="DVI-D*"
orientation="left"
offset="400"

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
    fi
done

config_file=~/.config/i3/config.d/0_Screens
rm $config_file
touch $config_file
echo "#Screen Variables" >> $config_file
echo $left >> $config_file
echo $right >> $config_file

echo xrandr --output $left --primary --auto --pos 0x0 --rotate $orientation --output $right --auto --right-of $left --rotate normal 
xrandr --output $left --primary --auto --pos 0x0 --rotate $orientation --output $right --auto --right-of $left --rotate normal 
