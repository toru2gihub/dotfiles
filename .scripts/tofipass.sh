#!/bin/sh

# ▀█▀▄▀▄█▀▄█ █
#  █ ▀▄▀█▀▄▀▄█
#  simple, clean, elegant
#
# Page: https://toru.codeberg.page/
# Mastodon: @averagetiger89
# Repository: https://codeberg.org/toru
# Email: torupublic11@waifu.club

#  _         __ _                     
# | |_ ___  / _(_)_ __   __ _ ___ ___ 
# | __/ _ \| |_| | '_ \ / _` / __/ __|
# | || (_) |  _| | |_) | (_| \__ \__ \
#  \__\___/|_| |_| .__/ \__,_|___/___/
#                |_|                  

###############################################################################
# This script is the SUDO_ASKPASS variable, meaning that it will be used as a #
# password prompt if needed.						      #
###############################################################################

tofi --output "$1" <&- && echo >/dev/null 2>&1
