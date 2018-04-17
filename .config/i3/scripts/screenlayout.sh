#!/bin/bash

#Mainscreen
Mainscreen="HDMI"
MainRelPositionTo="--right-of"
MainOrientation="normal"
MainOffset="0"

#Secondary Screen

SecondaryRelPositionTo="--left-of"
SecondaryOrientation="normal"
SecondaryOffset="0"

#Variables
#position: --left-of --right-of --above --below --same-as (other output)
#orientation: normal/inverted/left/right

#Main Screen
for output in $(xrandr | grep '\Wconnected'| awk '{ print $1 }'); do
    if [[ $output =~ $Mainscreen ]] ; then
        Main=$output
        echo "$output= " $Main
    fi
done

#Secondary Screen
for output in $(xrandr | grep '\Wconnected' | awk '{ print $1 }'); do
    if [[ ! $output =~ $Mainscreen ]] ; then
        Secondary=$output
        echo "right = " $Secondary
    fi
done

config_file=~/.config/i3/config.d/0_Screens
rm $config_file
touch $config_file
echo '#Screen Variables' >> $config_file
echo 'set $screen1' $Main>> $config_file
echo 'set $screen2' $Secondary>> $config_file
echo '' >> $config_file

echo xrandr --output $Main --primary --auto $RelPositionTo $Secondary --rotate $Orientation
xrandr --output $Main --primary --auto $RelPositionTo $Secondary --rotate $Orientation
xrandr --output $Secondary --auto Secondary --rotate $Orientation
