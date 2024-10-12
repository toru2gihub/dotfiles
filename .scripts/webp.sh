#!/bin/sh

# ▀█▀▄▀▄█▀▄█ █
#  █ ▀▄▀█▀▄▀▄█
#  simple, clean, elegant
#
# Page: https://toru.codeberg.page/
# Mastodon: @averagetiger89
# Repository: https://codeberg.org/toru
# Email: torupublic11@waifu.club

#               _                _     
# __      _____| |__  _ __   ___| |__  
# \ \ /\ / / _ \ '_ \| '_ \ / __| '_ \ 
#  \ V  V /  __/ |_) | |_) |\__ \ | | |
#   \_/\_/ \___|_.__/| .__(_)___/_| |_|
#                    |_|               

#####################################################
# Transform all the images in the directory to webp #
#####################################################

for i in * ; do magick -quality 20 "$i" "${i%.*}.webp" ; done
