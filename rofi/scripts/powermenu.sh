#!/bin/bash

# Power menu script using rofi

chosen=$(printf "Shutdown\nReboot\nLog Out" | rofi -dmenu -p "Power Menu:")

case "$chosen" in
    "Reboot") 
        reboot
        ;;
    "Shutdown") 
        poweroff
        ;;
    "Log Out") 
        i3-msg exit
 ..
         ;;
    *) 
        exit 1
        ;;
esac
