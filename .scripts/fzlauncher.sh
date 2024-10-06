#!/usr/bin/env bash
export TIME_STAMP="20241005.135417"

# ▀█▀▄▀▄█▀▄█ █
#  █ ▀▄▀█▀▄▀▄█
#  simple, clean, elegant
#
# Page: https://toru.codeberg.page/
# Mastodon: @averagetiger89
# Repository: https://codeberg.org/toru
# Email: torupublic11@waifu.club

#   __    _                        _               
#  / _|__| | __ _ _   _ _ __   ___| |__   ___ _ __ 
# | ||_  / |/ _` | | | | '_ \ / __| '_ \ / _ \ '__|
# |  _/ /| | (_| | |_| | | | | (__| | | |  __/ |   
# |_|/___|_|\__,_|\__,_|_| |_|\___|_| |_|\___|_|   

PROG=$( basename "$0" )

locations=( "$HOME/.local/share/applications" "/run/current-system/sw/share/applications" )

# shellcheck disable=SC2016
selected_app=$(
    find "${locations[@]}" -name '*.desktop' |
    while read -r desktop; do
        # cat=$( awk -F= '/Categories/ {print $1}' "$desktop" )
        name=${desktop##*/} # remove directory
        name=${name%.*}     # remove . suffix
        name=${name##*.}    # remove . prefixes
        echo "$name"
    done |
    column -t |
    fzf -i --exact --reverse --border --height 15 --ansi \
        --bind "home:first" --bind "end:last" \
        --prompt "Launch: " 
            )

echo "$PROG: $(date): selected app='$selected_app'" >> ~/.cache/fzf-launcher.log
if [[ "$selected_app" ]]; then
    # $selected_app is a fully qualified filename of a .desktop file
    app="${selected_app##*/}" # basename
    cd /
    setsid gtk-launch "$app" </dev/null &>/dev/null
fi
