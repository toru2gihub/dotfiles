#!/bin/sh

# ▀█▀▄▀▄█▀▄█ █
#  █ ▀▄▀█▀▄▀▄█
#  simple, clean, elegant
#
# Page: https://toru.codeberg.page/
# Mastodon: @averagetiger89
# Repository: https://codeberg.org/toru
# Email: torupublic11@waifu.club

var1="$extension"
var2="$delete"

    echo -n "Enter file extension: "
    read old

    echo -n "Enter string to delete: "
    read new

find . -name "*.$extension" -type f | xargs sed -i -e '/$delete/d'
