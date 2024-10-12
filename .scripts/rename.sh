#!/bin/sh

# ▀█▀▄▀▄█▀▄█ █
#  █ ▀▄▀█▀▄▀▄█
#  simple, clean, elegant
#
# Page: https://toru.codeberg.page/
# Mastodon: @averagetiger89
# Repository: https://codeberg.org/toru
# Email: torupublic11@waifu.club

#                                            _     
#  _ __ ___ _ __   __ _ _ __ ___   ___   ___| |__  
# | '__/ _ \ '_ \ / _` | '_ ` _ \ / _ \ / __| '_ \ 
# | | |  __/ | | | (_| | | | | | |  __/_\__ \ | | |
# |_|  \___|_| |_|\__,_|_| |_| |_|\___(_)___/_| |_|

################################################################
# Rename all the files into the directory in numerical order #
################################################################
                                                 
num=0; for i in *; do mv "$i" "$(printf '%04d' $num).${i#*.}"; ((num++)); done
