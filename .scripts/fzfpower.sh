#!/bin/sh

# ▀█▀▄▀▄█▀▄█ █
#  █ ▀▄▀█▀▄▀▄█
#  simple, clean, elegant
#
# Page: https://toru.codeberg.page/
# Mastodon: @averagetiger89
# Repository: https://codeberg.org/toru
# Email: torupublic11@waifu.club

###################################################
# control del poder del sistema con tofi+systemd #
###################################################

#dm="dmenu -i -c -l 4"
#dm="dmenu -l 4"
dm="fzf"

# Options
shutdown="shutdown"
suspend="suspend"
reboot="reboot"
logout="exit"

chosen=$(printf "$shutdown\n$reboot\n$logout\n$suspend" | $dm)
case $chosen in

    $shutdown)
  notify-send  "El systema se apagara en...." "$( echo "15 segundos" )" &
  sleep 5
  notify-send  "El systema se apagara en...." "$( echo "10 segundos" )" &
  sleep 5 
  notify-send  "El systema se apagara en...." "$( echo "5 segundos" )" &
  sleep 4
  su root -c systemctl poweroff 

        ;;
    $reboot)
   su root -c  reboot
        ;;

    $logout)
  pkill Hyprland
        ;;

    $suspend)
  #systemctl suspend && hyprlock
  systemctl suspend
        ;;
esac
