#!/bin/sh

#
# ~/.xsession
#
# Executed by xdm/gdm/kdm at login
#

xrdb -merge ~/.Xresources

feh --bg-scale ~/.wallpaper/balls.png

xcompmgr -c &

ibus-daemon -d

eval $(ssh-agent)

ssh-add ~/.ssh/id_rsa

xrandr

/usr/bin/xmonad
