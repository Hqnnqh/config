#!/bin/bash

set -e

SPRITES_DIR=$HOME/.config/buddy/sprites
CURRENT_SPRITES=$SPRITES_DIR/current_sprites

# check for current theme
if [ $(cat $CURRENT_SPRITES/current.txt) = "green" ]; then
	
	NEW_SPRITES=$SPRITES_DIR/red_slime_sprites
	echo "red" > $CURRENT_SPRITES/current.txt
else
	NEW_SPRITES=$SPRITES_DIR/green_slime_sprites
	echo "green" > $CURRENT_SPRITES/current.txt
fi

# update the sprites
cd $NEW_SPRITES
cp -r * $CURRENT_SPRITES

# update the slime
pkill -SIGUSR1 buddy

