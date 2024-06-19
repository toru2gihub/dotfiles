#!/bin/sh

# ▀█▀▄▀▄█▀▄█ █
#  █ ▀▄▀█▀▄▀▄█
#  simple, clean, elegant
#
# Page: https://toru.codeberg.page/
# Mastodon: @averagetiger89
# Repository: https://codeberg.org/toru
# Email: torupublic11@waifu.club

#  _         __ _                                   _   
# | |_ ___  / _(_)_   _ _ __ ___   ___  _   _ _ __ | |_ 
# | __/ _ \| |_| | | | | '_ ` _ \ / _ \| | | | '_ \| __|
# | || (_) |  _| | |_| | | | | | | (_) | |_| | | | | |_ 
#  \__\___/|_| |_|\__,_|_| |_| |_|\___/ \__,_|_| |_|\__|

########################################################################
# A tofi prompt to unmount drives.				       #
# Provides you with mounted partitions, select one to unmount.	       #
# Drives mounted at /, /boot and /home will not be options to unmount. #
########################################################################

unmountusb() {
	[ -z "$drives" ] && exit
	chosen="$(echo "$drives" | tofi --output "Unmount which drive?")" || exit 1
	chosen="$(echo "$chosen" | awk '{print $1}')"
	[ -z "$chosen" ] && exit
	sudo -A umount "$chosen" && notify-send "💻 USB unmounting" "$chosen unmounted."
	}

unmountandroid() { \
	chosen="$(awk '/simple-mtpfs/ {print $2}' /etc/mtab | tofi --output "Unmount which device?")" || exit 1
	[ -z "$chosen" ] && exit
	sudo -A umount -l "$chosen" && notify-send "🤖 Android unmounting" "$chosen unmounted."
	}

asktype() { \
	choice="$(printf "USB\\nAndroid" | tofi --output "Unmount a USB drive or Android device?")" || exit 1
	case "$choice" in
		USB) unmountusb ;;
		Android) unmountandroid ;;
	esac
	}

drives=$(lsblk -nrpo "name,type,size,mountpoint,label" | awk -F':' '{gsub(/ /,":")}$4!~/\/boot|\/efi|\/home$|SWAP/&&length($4)>1{printf "%s (%s) %s\n",$4,$3,$5}')

if ! grep simple-mtpfs /etc/mtab; then
	[ -z "$drives" ] && echo "No drives to unmount." &&  exit
	echo "Unmountable USB drive detected."
	unmountusb
else
	if [ -z "$drives" ]
	then
		echo "Unmountable Android device detected."
	       	unmountandroid
	else
		echo "Unmountable USB drive(s) and Android device(s) detected."
		asktype
	fi
fi
