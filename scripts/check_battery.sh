#!/bin/bash

# Añade esta línea a tu crontab: "crontab -e"
# */5 * * * * cd ~/.config/scripts/ && ./check_battery.sh

MIN_BATTERY_LEVEL=30

# Obtiene el nivel actual de la batería y el estado de carga
BATTERY_INFO=$(acpi -b)
CURRENT_BATTERY_LEVEL=$(echo "$BATTERY_INFO" | grep -Po '[0-9]+(?=%)')
CHARGING=$(echo "$BATTERY_INFO" | grep -c "Charging")

# Verifica si el nivel de batería es menor o igual al mínimo y si la batería no está cargando
if [ "$CURRENT_BATTERY_LEVEL" -le "$MIN_BATTERY_LEVEL" ] && [ "$CHARGING" -eq 0 ]; then
    export DISPLAY=:0 
    notify-send -u critical -t 5000 "Battery Low $CURRENT_BATTERY_LEVEL%. Please connect to power."
fi
