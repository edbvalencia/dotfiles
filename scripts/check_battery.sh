#!/bin/bash

#Add this line to crontab "crontab -e"
#*/5 * * * * cd ~/.config/scripts/ && ./check_battery.sh

MIN_BATTERY_LEVEL=30
CURRENT_BATTERY_LEVEL=$(acpi -b | grep -P -o '[0-9]+(?=%)')

if [ "$CURRENT_BATTERY_LEVEL" -le "$MIN_BATTERY_LEVEL" ]; then
    export DISPLAY=:0 #exporta al entorno grafico adecuado
    notify-send -u critical -t 5000 "Battery Low $CURRENT_BATTERY_LEVEL%. Please connect to power."
fi
