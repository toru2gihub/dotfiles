#!/bin/sh

# ▀█▀▄▀▄█▀▄█ █
#  █ ▀▄▀█▀▄▀▄█
#  simple, clean, elegant
#
# Page: https://toru.codeberg.page/
# Mastodon: @averagetiger89
# Repository: https://codeberg.org/toru
# Email: torupublic11@waifu.club

#     _                          _ __               
#  __| | _ __   ___  _ _   _  _ | '_ \ __ _  ___ ___
# / _` || '  \ / -_)| ' \ | || || .__// _` |(_-/(_-/
# \__/_||_|_|_|\___||_||_| \_._||_|   \__/_|/__//__/

###############################################################################
# This script is the SUDO_ASKPASS variable, meaning that it will be used as a #
# password prompt if needed.						      #
###############################################################################

dmenu -p "$1" <&- && echo >/dev/null 2>&1
