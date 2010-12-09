#!/bin/sh
# my .xinitrc file to start awesomewm

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


# make xautolock start slock after 5 minutes
${BIN_DIR}/xautolock -locker ${BIN_DIR}/slock -time 5 -notify 10 -notifier ~/.config/awesome/lock_notify.sh &

# set up dual output if there are two monitors
DUAL_MONITOR_CHECK="`xrandr -q | grep 'DVI-1'`"
if [ -n "${DUAL_MONITOR_CHECK}" ]; then
    xrandr --output DVI-1 --mode 1280x1024 --right-of DVI-0
fi


# start awesome
${BIN_DIR}/awesome --config ~/config/.config/awesome/rc.lua


