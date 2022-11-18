#!/bin/bash
# thermal
# Made by Dr. Waldijk
# A script to show CPU, etc temperatures.
# Read the README.md for more info
# By running this script you agree to the license terms.
# Config ----------------------------------------------------------------------------
THRNAM="thermal"
THRVER="0.1"
THROPT=$1
THRARG=$2
THRTMP=$(paste <(cat /sys/class/thermal/thermal_zone*/type) <(cat /sys/class/thermal/thermal_zone*/temp) | column -s $'\t' -t | sed 's/\(.\)..$/.\1°C/')
# source: https://www.baeldung.com/linux/cpu-temperature
# -----------------------------------------------------------------------------------
if [[ "$THROPT" = "all" ]]; then
    if [[ "$THRARG" = "loop" ]]; then
        while :; do
            clear
            echo "THRTMP"
            sleep 10s
        done
    else
        echo "THRTMP"
    fi
elif [[ "$THROPT" = "cpu" ]]; then
    if [[ "$THRARG" = "loop" ]]; then
        while :; do
            clear
            echo "THRTMP" | grep x86_pkg_temp
            sleep 10s
        done
    else
        echo "THRTMP" | grep x86_pkg_temp
    fi
else
    echo "$THRNAM v$THRVER"
    echo ""
    echo "Yeah nah..."
fi
