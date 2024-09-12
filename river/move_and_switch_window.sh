#!/bin/sh
# move_and_switch.sh: Moves a window to a tag and switches focus to that tag

# $1 is the tag argument passed to the script
tag=$1

# Move the focused view to the tag and set the focused tags
riverctl set-view-tags $tag
riverctl set-focused-tags $tag
