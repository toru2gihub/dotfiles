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

###############################################################
# Resize all the images in the current directory to 1920x1080 #
###############################################################

for f in *.{jpg,jpeg,png,webp}
	 do
	     magick "$f" -resize '1920x1080!' "output_$f"
done
