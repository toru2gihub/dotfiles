#!/bin/sh

# ▀█▀▄▀▄█▀▄█ █
#  █ ▀▄▀█▀▄▀▄█
#  simple, clean, elegant
#
# Page: https://toru.codeberg.page/
# Mastodon: @averagetiger89
# Repository: https://codeberg.org/toru
# Email: torupublic11@waifu.club

#  __ _  _  _                 _  _ __  _   
# / _` |(_)| |_  ___ __  _ _ (_)| '_ \| |_ 
# \__. || ||  _|(_-// _|| '_|| || .__/|  _|
# |___/ |_| \__|/__/\__||_|  |_||_|    \__|

#####################################
# simple git script for fast pacing #
#####################################

if [[ -d .git ]]; then
    git add .

    echo -n "Enter the commit message: "
    read commit_message

    current_branch=$(git rev-parse --abbrev-ref HEAD)

    git commit -m "$commit_message"

    git push origin $current_branch
else
    echo "Not a git repo"
fi
