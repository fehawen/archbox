#
# ~/.xinitrc
#

xset b off
xset m 1/1
xset +fp ~/.fonts
xset r rate 200 60
xrdb -merge ~/.Xresources
setxkbmap -layout se
xsetroot -solid "#08090c"

conky -q -d -c ~/.conky1rc &
conky -q -d -c ~/.conky2rc &

exec i3 -c ~/.i3rc
