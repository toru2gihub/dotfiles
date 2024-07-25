#!/usr/bin/env bash

# Created By: Javier Pacheco - javier@jpacheco.xyz
# Created On: 23/07/24
# Project: mount usb devices using fzf in terminal

getmount() { 
 [ -z "$chosen" ] && exit 1
        # shellcheck disable=SC2086
 mp="$(find $1 2>/dev/null | fzf --prompt "Type in mount point: ")" || exit 1
 test -z "$mp" && exit 1
 if [ ! -d "$mp" ]; then
  mkdiryn=$(printf "No\nYes" | fzf --prompt "$mp does not exist. Create it? ") || exit 1
  [ "$mkdiryn" = "Yes" ] && (mkdir -p "$mp" || sudo mkdir -p "$mp")
 fi
}

mountusb() { 
 chosen="$(echo "$usbdrives" | fzf --prompt "Mount which drive? ")" || exit 1
 chosen="$(echo "$chosen" | awk '{print $1}')"
 sudo mount "$chosen" 2>/dev/null && notify-send "USB mounting" "$chosen mounted." && exit 0
 alreadymounted=$(lsblk -nrpo "name,type,mountpoint" | awk '$3!~/\/boot|\/home$|SWAP/&&length($3)>1{printf "-not ( -path *%s -prune ) ",$3}')
 getmount "/mnt /media /mount /home -maxdepth 5 -type d $alreadymounted"
 partitiontype="$(lsblk -no "fstype" "$chosen")"
 case "$partitiontype" in
  "vfat") sudo mount -t vfat "$chosen" "$mp" -o rw,umask=0000;;
  "exfat") sudo mount "$chosen" "$mp" -o uid="$(id -u)",gid="$(id -g)";;
  *) sudo mount "$chosen" "$mp"; user="$(whoami)"; ug="$(groups | awk '{print $1}')"; sudo chown "$user":"$ug" "$mp";;
 esac
 notify-send "USB mounting" "$chosen mounted to $mp."
}

unmountusb() {
 chosen="$(lsblk -nrpo "name,mountpoint" | awk '$2!=""{print $1 " (" $2 ")"}' | fzf --prompt "Unmount which drive? ")" || exit 1
 chosen="$(echo "$chosen" | awk '{print $1}')"
 sudo umount "$chosen" && notify-send "USB unmounting" "$chosen unmounted."
}

mountandroid() { 
 chosen="$(echo "$anddrives" | fzf --prompt "Which Android device? ")" || exit 1
 chosen="$(echo "$chosen" | cut -d : -f 1)"
 getmount "$HOME -maxdepth 3 -type d"
        simple-mtpfs --device "$chosen" "$mp"
 echo "OK" | fzf --prompt "Tap Allow on your phone if it asks for permission and then press enter " || exit 1
 simple-mtpfs --device "$chosen" "$mp"
 notify-send "🤖 Android Mounting" "Android device mounted to $mp."
}

unmountandroid() {
 chosen="$(mount | grep simple-mtpfs | awk '{print $3}' | fzf --prompt "Unmount which Android mount point? ")" || exit 1
 simple-mtpfs -u "$chosen" && notify-send "🤖 Android Unmounting" "Android device unmounted from $chosen."
}

askmounttype() { 
 choice="$(printf "USB\nAndroid" | fzf --prompt "Mount a USB drive or Android device? ")" || exit 1
 case $choice in
  USB) mountusb ;;
  Android) mountandroid ;;
 esac
}

askunmounttype() { 
 choice="$(printf "USB\nAndroid" | fzf --prompt "Unmount a USB drive or Android device? ")" || exit 1
 case $choice in
  USB) unmountusb ;;
  Android) unmountandroid ;;
 esac
}

asktype() { 
 choice="$(printf "Mount\nUnmount" | fzf --prompt "Do you want to mount or unmount a device? ")" || exit 1
 case $choice in
  Mount) askmounttype ;;
  Unmount) askunmounttype ;;
 esac
}

clear
anddrives=$(simple-mtpfs -l 2>/dev/null)
usbdrives="$(lsblk -rpo "name,type,size,mountpoint" | grep 'part\|rom' | awk '$4==""{printf "%s (%s)\n",$1,$3}')"

echo "Detecting devices..."
asktype
