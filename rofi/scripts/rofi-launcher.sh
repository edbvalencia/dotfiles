#!/bin/bash

# Obtener la ruta del directorio donde se encuentra este script
script_dir="$(dirname "$0")"

# Definir las opciones del menú de Rofi
options="Applications\nScripts\nWiFi\nPowerMenu"

# Mostrar el menú de Rofi y obtener la opción seleccionada
selected_option=$(echo -e "$options" | rofi -dmenu -p "Options:")

# Ejecutar la acción correspondiente a la opción seleccionada
case "$selected_option" in
    "Applications")
        rofi -show drun
        ;;
    "Scripts")
        rofi -show run
        ;;
    "WiFi")
        "$script_dir/rofi-wifi.sh"
        ;;
    "PowerMenu")
        "$script_dir/powermenu.sh"
        ;;
    *)
        exit 0
        ;;
esac
 ..
 