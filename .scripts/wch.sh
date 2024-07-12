#!/bin/sh

# ▀█▀▄▀▄█▀▄█ █
#  █ ▀▄▀█▀▄▀▄█
#  simple, clean, elegant
#
# Page: https://toru.codeberg.page/
# Mastodon: @averagetiger89
# Repository: https://codeberg.org/toru
# Email: torupublic11@waifu.club

#               _
#  _ __ __  __ | |_
#  \ V  V // _||   \
#   \_/\_/ \__||_||_|

############################################################
# this script change to a random wallpaper (look the path) #
############################################################

# Set the directory containing your wallpapers
#
#WALLPAPER_DIR="/home/toru/pic/wallpapers/guweiz"
#WALLPAPER_DIR="/home/toru/pic/wallpapers/based"
#WALLPAPER_DIR="/home/toru/pic/wallpapers/animation"
#WALLPAPER_DIR="/home/toru/pic/wallpapers/fantasy"
#WALLPAPER_DIR="/home/toru/pic/wallpapers/anime"
#WALLPAPER_DIR="/home/toru/pic/wallpapers/samurais"
#WALLPAPER_DIR="/home/toru/pic/wallpapers/real"
WALLPAPER_DIR="/home/toru/pic/art"

# Get a random wallpaper from the directory
RANDOM_WALLPAPER=$(ls $WALLPAPER_DIR | shuf -n 1)

# Set the wallpaper using feh
 swww img -t fade $file "$WALLPAPER_DIR/$RANDOM_WALLPAPER"

# Save the current wallpaper path to a file for later deletion
echo "$WALLPAPER_DIR/$RANDOM_WALLPAPER" > ~/.config/wall.png
