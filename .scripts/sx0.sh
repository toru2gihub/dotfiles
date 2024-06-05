#!/bin/bash

# ▀█▀▄▀▄█▀▄█ █
#  █ ▀▄▀█▀▄▀▄█
#  simple, clean, elegant
#
# Page: https://toru.codeberg.page/
# Mastodon: @averagetiger89
# Repository: https://codeberg.org/toru
# Email: torupublic11@waifu.club

#           /  _ \ 
#   ___     | ( ) |
# /  __) \/ ) | | |
# \__  \)  (| (_) |
# (____/_/\_)\___/ 

################################################################################################
# This scripts share files using the 0x0.st website, and copy the select file to the clipboard #
################################################################################################

file=$( ls -a | fzf --layout=reverse --border --margin=3% --info=inline --prompt="Share File: ")
curl -F "file=@$file" 0x0.st | xclip -selection c
notify-send "Your file is on 0x0.st"
