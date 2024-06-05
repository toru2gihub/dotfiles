#!/bin/sh

#   __                _ __               
#  / _| _  _  ___ ___| '_ \ __ _  ___ ___
# |  _|| || ||_ /|_ /| .__// _` |(_-/(_-/
# |_|   \_._|/__|/__||_|   \__/_|/__//__/
#
# Page: https://toru.codeberg.page/
# Mastodon: @averagetiger89
# Repository: https://codeberg.org/toru
# Email: torupublic11@waifu.club

###########################################################################
# this script is a combination with fzf and pass (password manager)	  #
# it uses an fzf interface to look your .password-store (if you have one) #
###########################################################################

lpath=$(find ~/.password-store/ -name "*.gpg"  | \
 sed -r 's,(.*)\.password-store/(.*)\.gpg,\2,'   | \
 fzf +m);
[[ -z "$lpath" ]] && exit
pass show -c "$lpath"
truepass=$(pass show "$lpath")
pass=$(echo "$truepass" | awk 'NR!=1')
notify-send "$pass"
echo "$pass"
read -r
pass=$( echo "$truepass" | awk 'NR==1')
clipdel -d "$pass"
