#!/bin/sh

# ▀█▀▄▀▄█▀▄█ █
#  █ ▀▄▀█▀▄▀▄█
#  simple, clean, elegant
#
# Page: https://toru.codeberg.page/
# Mastodon: @averagetiger89
# Repository: https://codeberg.org/toru
# Email: torupublic11@waifu.club

#  _             _                            _               _     
# | |_ ___  _ __(_)_ __ ___  ___ ___  _ __ __| | ___ _ __ ___| |__  
# | __/ _ \| '__| | '__/ _ \/ __/ _ \| '__/ _` |/ _ \ '__/ __| '_ \ 
# | || (_) | |  | | | |  __/ (_| (_) | | | (_| |  __/ |_ \__ \ | | |
#  \__\___/|_|  |_|_|  \___|\___\___/|_|  \__,_|\___|_(_)|___/_| |_|

###################################################
# Grabar la pantalla mediante wf-recorder (wayland) #
###################################################

dm="tofi"

# Options
Screen="Screen"
Selection="Selection"
Audio="Audio"

chosen=$(printf "$Screen\n$Selection\n$Audio" | $dm --output "Record Screen:")
case $chosen in

    $Screen)
  wf-recorder

        ;;
    $Selection)
   wf-recorder -g "$(slurp)"
        ;;

    $Audio)
  wf-recorder --audio --file=recording_audio.mp4
        ;;

esac
