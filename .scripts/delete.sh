#!/bin/sh

# ▀█▀▄▀▄█▀▄█ █
#  █ ▀▄▀█▀▄▀▄█
#  simple, clean, elegant
#
# Page: https://toru.codeberg.page/
# Mastodon: @averagetiger89
# Repository: https://codeberg.org/toru
# Email: torupublic11@waifu.club

#      _      _      _             _     
#   __| | ___| | ___| |_ ___   ___| |__  
#  / _` |/ _ \ |/ _ \ __/ _ \ / __| '_ \ 
# | (_| |  __/ |  __/ ||  __/_\__ \ | | |
#  \__,_|\___|_|\___|\__\___(_)___/_| |_|

########################################
# It replace a string with a new value #
########################################

var1="$extension"
var2="$delete"

    echo -n "Enter file extension: "
    read old

    echo -n "Enter string to delete: "
    read new

find . -name "*.$extension" -type f | xargs sed -i -e '/$delete/d'
