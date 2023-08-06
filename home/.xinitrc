#
# ~/.xinitrc
#

xset b off
xset m 1/1
xset +fp ~/.fonts
xset r rate 200 60
xrdb -merge ~/.Xresources
setxkbmap -layout se
xsetroot -solid "#001e3c"

exec i3 -c $HOME/.i3rc
