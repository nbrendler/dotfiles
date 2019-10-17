#!/bin/sh

#
# ~/.xsession
#
# Executed by xdm/gdm/kdm at login
#

xrdb -merge ~/.Xresources

xcompmgr -c &

ibus-daemon -d

eval $(ssh-agent)

ssh-add ~/.ssh/id_rsa

xrandr

/usr/bin/xmonad
