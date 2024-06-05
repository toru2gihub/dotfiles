#!/bin/sh

# ▀█▀▄▀▄█▀▄█ █
#  █ ▀▄▀█▀▄▀▄█
#  simple, clean, elegant
#
# Page: https://toru.codeberg.page/
# Mastodon: @averagetiger89
# Repository: https://codeberg.org/toru
# Email: torupublic11@waifu.club

# ░█▀▀▄░█░▒█░█░░█░▄
# ░█▀▀▄░█░▒█░█░░█▀▄
# ░▀▀▀▀░░▀▀▀░▀▀░▀░▀

#############################################################################################
# TOTAL BULKRENAME IN MANY FILES (PLAIN TEXT, WE DON'T WORK WITH THAT SHIT OF RICH FORMAT ) #
# IN A GIVEN DIRECTORY (BEST SCRIPT EVER) 						    #
#############################################################################################

var1="$old"
var2="$new"

    echo -n "Enter old string: "
    read old

    echo -n "Enter new string: "
    read new

find $1 \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 sed -i "s/$old/$new/g"
