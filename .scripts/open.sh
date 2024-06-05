#!/bin/sh

# ▀█▀▄▀▄█▀▄█ █
#  █ ▀▄▀█▀▄▀▄█
#  simple, clean, elegant
#
# Page: https://toru.codeberg.page/
# Mastodon: @averagetiger89
# Repository: https://codeberg.org/toru
# Email: torupublic11@waifu.club

#       _ __
#  ___ | '_ \ ___  _ _
# / _ \| .__// -_)| ' \
# \___/|_|   \___||_||_|

#########################################################
# this script opens the file with the xdg-open standard #
#########################################################

OPENER="xdg-open"
file=$(readlink -f "$1")
dir=$(dirname "$file")
base="${file%.*}"

# define a custom 'open' command
# This command is called when current file is not a directory. You may want to
# use either file extensions and/or mime types here. Below uses an editor for
# text files and a file opener for the rest.
case $base in
  *\.blend)
    blender "$file"
    ;;
  *\.xopp)
    xournalpp "$file"
    ;;
esac

case $(file --mime-type "$*" -b) in
  # follow symlinks
  inode/symlink) $0 "$(readlink "$*")" && exit;;
  # open text files with vim
  text/*) ${EDITOR:-vi} "$*";;
  *) for f in "$@"; do setsid "${OPENER}" "${f}" > /dev/null 2> /dev/null & done;;
esac
# vim: set tw=78 ts=2 et sw=2 sr:
