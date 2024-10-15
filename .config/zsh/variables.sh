#!/bin/sh

#░█▒█▒▄▀▄▒█▀▄░█▒▄▀▄░██▄░█▒░▒██▀░▄▀▀
#░▀▄▀░█▀█░█▀▄░█░█▀█▒█▄█▒█▄▄░█▄▄▒▄██
TERMINAL="foot"
EDITOR="emacsclient -c -a 'emacs'"
VISUAL="emacsclient -c -a 'emacs'"
# EDITOR="nvim"
# VISUAL="nvim"
FILE="yazi"
BROWSER="firefox"
IMAGEVIEWER="nsxiv"
READER="zathura"
PAGER="less"
HISTSIZE=10000000
SAVEHIST=10000000
HISTDUP=erase
HISTFILE="$HOME/.local/share/.zsh_history"
PATH="$HOME/.scripts":$PATH
PATH="$HOME/.local/bin":$PATH
#SUDO_ASKPASS="$HOME/.scripts/tofipass.sh"
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}
XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
#MANPAGER="nvim +Man!"
#MANPAGER="sh -c 'col -bx | bat -l man -p'"
#SUDO_ASKPASS=/usr/X11R6/bin/ssh-askpass
XDG_DESKTOP_DIR="$HOME/dk"
XDG_DOCUMENTS_DIR="$HOME/dc"
XDG_DOWNLOAD_DIR="$HOME/dl"
XDG_MUSIC_DIR="$HOME/ms"
XDG_PICTURES_DIR="$HOME/pic"
XDG_PUBLICSHARE_DIR="$HOME/pu"
XDG_TEMPLATES_DIR="$HOME/tem"
XDG_VIDEOS_DIR="$HOME/vd"
