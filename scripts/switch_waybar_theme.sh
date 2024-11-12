#!/bin/bash
WAYBAR_DIR="$HOME/.config/waybar"
THEMES="$WAYBAR_DIR/themes"

if diff "$THEMES/dark.css" "$WAYBAR_DIR/style.css" > /dev/null; then
	# current theme is dark
	cp "$THEMES/light.css" "$WAYBAR_DIR/style.css"
else
	# current theme is light
	cp "$THEMES/dark.css" "$WAYBAR_DIR/style.css"
fi

echo "Waybar theme switched"
pkill -SIGUSR2 waybar # update waybar
