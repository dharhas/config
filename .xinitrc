#!/bin/sh
# $Xorg: xinitrc.cpp,v 1.3 2000/08/17 19:54:30 cpqbld Exp $


BIN_DIR=/usr/bin
SBIN_DIR=/usr/sbin
LIB_DIR=/usr/local/lib

userresources=${HOME}/config/.Xresources
usermodmap=${HOME}/config/.Xmodmap
sysresources=${LIB_DIR}/X11/xinit/.Xresources
sysmodmap=${LIB_DIR}/X11/xinit/.Xmodmap


# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi


# start some nice programs
${BIN_DIR}/xautolock -locker ${BIN_DIR}/slock -time 5 -notify 10 -notifier ~/.config/awesome/lock_notify.sh &

${BIN_DIR}/awesome --config ~/config/.config/awesome/rc.lua


