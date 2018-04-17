#!/bin/bash

config_file=~/.config/i3/config.d/0_Screens

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

echo "Connected Monitors are: "

#Main Screen
for output in $(xrandr | grep '\Wconnected'| awk '{ print $1 }'); do
    if [[ $output =~ $Mainscreen ]] ; then
        Main=$output
        echo "Main = "$Main
    fi
done

#Secondary Screen
for output in $(xrandr | grep '\Wconnected' | awk '{ print $1 }'); do
    if [[ ! $output =~ $Mainscreen ]] ; then
        Secondary=$output
        echo "Secondary = "$Secondary
    fi
done

echo ""

rm $config_file
touch $config_file
echo 'set $screen1' $Main>> $config_file
echo 'set $screen2' $Secondary>> $config_file
echo '' >> $config_file

echo "configuring i3 config > $config_file"
cat $config_file

echo "configuring xrandr displays"
echo xrandr --output $Main --primary --auto $MainRelPositionTo $Secondary --rotate $MainOrientation
xrandr --output $Main --primary --auto $MainRelPositionTo $Secondary --rotate $MainOrientation
echo xrandr --output $Secondary --auto $SecondaryRelPositionTo $Main --rotate $SecondaryOrientation
xrandr --output $Secondary --auto $SecondaryRelPositionTo $Main --rotate $SecondaryOrientation
