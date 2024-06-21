#!/bin/sh

# ▀█▀▄▀▄█▀▄█ █
#  █ ▀▄▀█▀▄▀▄█
#  simple, clean, elegant
#
# Page: https://toru.codeberg.page/
# Mastodon: @averagetiger89
# Repository: https://codeberg.org/toru
# Email: torupublic11@waifu.club
                        
#        _       _           _                _    
#  _ _  (_)__ __| |_   _  _ | |__         ___| |_  
# | ' \ | |\ \ /|   \ | || ||  _ \  _    (_-/|   \ 
# |_||_||_|/_\_\|_||_| \_._||____/ (_)   /__/|_||_|

#####################################################
# Mi menu para el mantenimiento de mi sistema NixOS #
#####################################################

show_menu(){
    normal=`echo "\033[m"`
    menu=`echo "\033[34m"`   #Blue
    number=`echo "\033[0m"` #White
    bgred=`echo "\033[41m"`
    fgred=`echo "\033[31m"`
    printf "\n${menu}========================================${normal}\n"
    printf "${menu}${number} 1)${menu} Upgrade Pkgs.${normal}\n"
    printf "${menu}${number} 2)${menu} Upgrade & Rebuild system.${normal}\n"
    printf "${menu}${number} 3)${menu} Rebuild.${normal}\n"
    printf "${menu}${number} 4)${menu} Garbage Collector.${normal}\n"
    printf "${menu}${number} 5)${menu} List generations.${normal}\n"
    printf "${menu}========================================${normal}\n"
    printf "Selecciona ${fgred}q para salir. ${normal}"
    read opt
}

option(){
    msgcolor=`echo "\033[01;31m"` # bold red
    normal=`echo "\033[00;00m"`   # normal white
    message=${@:-"${normal}Error: No message passed"}
    printf "${msgcolor}${message}${normal}\n"
}

clear
show_menu
while [ $opt != '' ]

    do
    if [ $opt = '' ]; then
      exit;
    else
      case $opt in
        1) clear; # UPGRADE PKGS
            sudo nix-channel --update;  
            show_menu;
        ;;
        2) clear; # UPGRADE SYSTEM
             sudo nixos-rebuild switch --upgrade;
            show_menu;
        ;;
        3) clear; # REBUILD
            sudo nixos-rebuild switch;
            show_menu;
        ;;
        4) clear; # Garbage Collector
            #nix-collect-garbage --delete-older-than 1d;
            sudo nix-collect-garbage;
            show_menu;
        ;;
        5) clear; #
            sudo nix-env -p /nix/var/nix/profiles/system --list-generations;
            show_menu;
        ;;
        q)exit;
        ;;
        \n)exit;
        ;;
        *)clear;
            option "Error en la selección.";
            show_menu;
        ;;
      esac
    fi
done
