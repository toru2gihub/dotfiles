#!/bin/sh

# ▀█▀▄▀▄█▀▄█ █
#  █ ▀▄▀█▀▄▀▄█
#  simple, clean, elegant
#
# Page: https://toru.codeberg.page/
# Mastodon: @averagetiger89
# Repository: https://codeberg.org/toru
# Email: torupublic11@waifu.club

#   __       _        _    
#  / _| ___ | |_  __ | |_  
# |  _|/ -_)|  _|/ _||   \ 
# |_|  \___| \__|\__||_||_|

##################################
# the simple fetch with no bloat #
##################################

#Informacion del sistema
 
kernel="$(uname -r)"
name="$(printf "toru@nixos")"
os="$(echo "$PRETTY_NAME")"
sys="$(echo $(uname))"
shell=$(printf "$(basename $SHELL)")
#init=$(cat /proc/1/comm)
cpu="$(lscpu | awk '/name/ {print $3, $4, $7, $8}')"
tr="$(printf "$TERM")"

#Información del WM

ui=$(echo "sway")

#Detección de ram

memused=$( free -m | awk '/^Mem:/ {print $3 "MiB"}')
memtotal=$( free -m | awk '/^Mem:/ {print $2 "MiB"}')

#Detección de disco

storageused=$(df -h / | grep "/" | awk '{print $3}')
storageavail=$(df -h / | grep "/" | awk '{print $2}')
st=$(df -h / | grep "/" | awk '{print $2" / " $4" / "$3}')

cat <<EOF
    ${name}${reset}
    ${kernel}${reset}
    ${ui}${reset}
    ${tr}${reset}
    ${shell}${reset}
    ${cpu}${reset}
    ${memused}/${memtotal}${reset}
    ${storageused}/${storageavail}
EOF
#    > ${init}${reset}
