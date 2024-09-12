#!/bin/bash

WALLPAPER_PATH="~/.config/wallpapers/zelda_animated.gif"

# Set wallpaper for eDP-1
swww img "$WALLPAPER_PATH" -o eDP-1

# Set wallpaper for HDMI-A-1 if connected
if wlr-randr | grep -q "HDMI-A-1"; then
    swww img "$WALLPAPER_PATH" -o HDMI-A-1
fi
