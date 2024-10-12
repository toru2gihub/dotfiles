#!/bin/sh

# ▀█▀▄▀▄█▀▄█ █
#  █ ▀▄▀█▀▄▀▄█
#  simple, clean, elegant
#
# Page: https://toru.codeberg.page/
# Mastodon: @averagetiger89
# Repository: https://codeberg.org/toru
# Email: torupublic11@waifu.club

#                                             _   
#  ___  ___ _ __ ___  ___ _ __   ___ __ _ ___| |_ 
# / __|/ __| '__/ _ \/ _ \ '_ \ / __/ _` / __| __|
# \__ \ (__| | |  __/  __/ | | | (_| (_| \__ \ |_ 
# |___/\___|_|  \___|\___|_| |_|\___\__,_|___/\__|

###############################################################################
# Project: Screen recorder in wayland					      #
# Dependencies: wf-recorder wl-copy and a launcher like dmenu, fuzzel, etc. #
###############################################################################

SOUND_CARD=$(pactl list sources | awk '/Name/ && /.monitor/ {print $2}')

screencast() {
   wf-recorder --audio=$SOUND_CARD -f ~/dl/screencast.mp4
}

area() {
   wf-recorder --audio=$SOUND_CARD -g "$(slurp)" -f ~/dl/screencast.mp4
}

check_connection() {
    ping -c 1 google.com 1> /dev/null 2>&1
}

share() {
    hyprctl notify 2 5000 "rgb(153276)" "fontsize:15  Uploading video to 0x0.st"
    curl -F "file=@~/dl/screencast.mp4" https://0x0.st | wl-copy && hyprctl notify 2 5000 "rgb(153276)" "fontsize:15  Video stored in 0x0.st"
}

kill_proc(){
    pkill --signal SIGINT wf-recorder
    if [ $? -eq 0 ];
    then
		hyprctl notify 2 5000 "rgb(153276)" "fontsize:15 Video was stored in ~/dl/screencast.mp4"
        pkill --signal SIGINT wf-recorder
        exit 0
    fi
}

remove_vid() {
    [ -f ~/dl/screencast.mp4 ] && rm ~/dl/screencast.mp4
}

kill_proc

OPT=$(printf "screencast\narea\nshare\nquit" | fzf --prompt 'Select an option: ' )
case $OPT in
    'screencast')
        sleep 1
        remove_vid
        sleep 1
        screencast
        share;;
    'area')
        sleep 1
        remove_vid
        sleep 1
        area;;
    'share') 
        check_connection && share || hyprctl notify 3 5000 "rgb(ff5566)" "fontsize:15 Video was stored in ~/dl/screencast.mp4";;
    *|quit) exit 0;;
esac
