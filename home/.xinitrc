#
# ~/.xinitrc
#

xset b off
xset m 1/1
xset +fp ~/.fonts
xset r rate 200 60
xrdb -merge ~/.Xresources

exec i3 -c $HOME/.i3rc
