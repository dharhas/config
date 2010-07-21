#!/bin/sh
#
# script for grabbing interesting backgrounds
#

background_url00="http://antwrp.gsfc.nasa.gov/apod/image/1007/TSE2010_JLD4.jpg"
background_name00="solar_eclipse.jpg"

for i in 0 1 2 3 4 5 6 7 8 9; do
    for j in 0 1 2 3 4 5 6 7 8 9; do
        background_url=`eval echo \\$background_url$i$j`
        background_name=`eval echo \\$background_name$i$j`

        if [ "${background_url}" ]; then
            if [ "${background_name}" ]; then
                curl ${background_url} > ${background_name}
            fi
        fi
    done
done
