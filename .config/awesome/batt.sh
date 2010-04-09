#!/bin/sh
#
# Battery status script for widget
#
if [ `acpiconf -i 0 | grep "State:" | awk '{print $2}'` = 'charging' ]; then
    BATTERY_SIGN='+'
  else
    BATTERY_SIGN='-'
fi

BATTERY_PERCENT=`acpiconf -i 0 | grep "Remaining capacity:" | awk '{print $3}'`

echo ${BATTERY_SIGN} ${BATTERY_PERCENT}