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
export DISPLAY=:0

# Set xdg backend to wlroots
systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=river

# Notification daemon
dunst &

# Background image
swww-daemon &
kanshi &
# swww img ~/.config/wallpapers/zelda_animated.gif

# Buddy
buddy -x 100 -y 1035 -c 40 -m 15 &      
