#!/bin/bash
ICON=$HOME/.config/i3/scripts/icons/lock.png

TMPBG=/tmp/screen.png
#trap 'rm -f "$TMPBG" EXIT'

RES=$(xrandr | grep 'current' | sed -E 's/.*current\s([0-9]+)\sx\s([0-9]+).*/\1x\2/')
 
ffmpeg -f x11grab -video_size $RES -y -i $DISPLAY -i $ICON -filter_complex "boxblur=5:1,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -vframes 1 $TMPBG -loglevel quiet

#feh $ICON
3lock -i $TMPBG
