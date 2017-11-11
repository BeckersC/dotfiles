#Delete and regenerate i3 conf
rm ~/.config/i3/conf
cat ~/.config/i3/conf.d/* > ~/.config/i3/conf

i3 &

i3lock
