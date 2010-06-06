#!/bin/sh
#
# Battery status script for widget
#

if [ `uname` = 'Linux' ]; then
    # Linux batter check
    if [ `cat /sys/class/power_supply/BAT0/status` = 'Charging' ]; then
        BATTERY_SIGN='+'
      else
        BATTERY_SIGN='-'
    fi

    BATTERY_PERCENT=$(expr $(expr `cat /sys/class/power_supply/BAT0/charge_now` \* 100) / `cat /sys/class/power_supply/BAT0/charge_full`)
  else
    # FreeBSD battery check
    if [ `acpiconf -i 0 | grep "State:" | awk '{print $2}'` = 'charging' ]; then
        BATTERY_SIGN='+'
      else
        BATTERY_SIGN='-'
    fi

    BATTERY_PERCENT=`acpiconf -i 0 | grep "Remaining capacity:" | awk '{print $3}'`
fi


echo ${BATTERY_SIGN} ${BATTERY_PERCENT}