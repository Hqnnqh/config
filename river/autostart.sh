#!/bin/sh
# Autostart script for River

# Start Waybar
waybar &

# Other apps like clipboard manager or polkit agent
wl-paste -t text --watch clipman store --no-persist &
/usr/lib/polkit-kde-authentication-agent-1 &

# Set GTK dark mode preference
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

# Environment variables
export XCURSOR_SIZE=24
export QT_QPA_PLATFORMTHEME=qt5ct

# Background image
swww-daemon &
swww img ~/.config/wallpapers/zelda_animated.gif

# ChickenBuddy
cb &
