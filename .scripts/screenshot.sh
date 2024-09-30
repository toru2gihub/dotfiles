#!/bin/sh

# ▀█▀▄▀▄█▀▄█ █
#  █ ▀▄▀█▀▄▀▄█
#  simple, clean, elegant
#
# Page: https://toru.codeberg.page/
# Mastodon: @averagetiger89
# Repository: https://codeberg.org/toru
# Email: torupublic11@waifu.club

#                                   _           _   
#  ___  ___ _ __ ___  ___ _ __  ___| |__   ___ | |_ 
# / __|/ __| '__/ _ \/ _ \ '_ \/ __| '_ \ / _ \| __|
# \__ \ (__| | |  __/  __/ | | \__ \ | | | (_) | |_ 
# |___/\___|_|  \___|\___|_| |_|___/_| |_|\___/ \__|

#################################################################
# Project: Screen share script to store a quick img to 0x0.st #
#################################################################

MENU="tofi"

OPT=$(printf "Desktop\nWindow\nSelection\nQuit" | tofi --prompt "Select Capture: ")

# capture the desktop
desktop() {
    grimblast copy screen && hyprctl notify 2 5000 "rgb(153276)" "fontsize:16 Desktop copy to clipboard"
}

# capture focused window
window() {
    grimblast copy active && hyprctl notify 2 5000 "rgb(153276)" "fontsize:16 Window copy to clipboard"
}

# select region
selection() {
    grimblast copy area && hyprctl notify 2 5000 "rgb(153276)" "fontsize:16 Selection copy to clipboard"
}

case $OPT in
    desktop)
	sleep 1
	desktop
	;;
    window)
	sleep 1
	window
        ;;
    selection)
	sleep 1
        selection
        ;;
    *|quit)
	exit 0
	;;
esac
