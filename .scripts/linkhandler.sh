#!/bin/sh

# ▀█▀▄▀▄█▀▄█ █
#  █ ▀▄▀█▀▄▀▄█
#  simple, clean, elegant
#
# Page: https://toru.codeberg.page/
# Mastodon: @averagetiger89
# Repository: https://codeberg.org/toru
# Email: torupublic11@waifu.club

#  _  _        _    _                    _  _           
# | |(_) _ _  | |__| |_   __ _  _ _   __| || | ___  _ _ 
# | || || ' \ | / /|   \ / _` || ' \ / _` || |/ -_)| '_|
# |_||_||_||_||_\_\|_||_|\__/_||_||_|\__/_||_|\___||_|  

############################################
# para ser usado con newsboat		   #
# descarga videos de youtube (con el link) #
# con yt-dlp				   #
############################################

if [ -z "$1" ]; then
	url="$(xclip -o)"
else
	url="$1"
fi

case "$url" in
	*mkv|*webm|*mp4|*rumble.com*|*youtube.com/watch*|*youtube.com/playlist*|*youtube.com/shorts*|*youtu.be*|*hooktube.com*|*bitchute.com*|*videos.lukesmith.xyz*|*odysee.com*)
		yt-dlp -S res:1080 -P ~/dl -quiet "$url" >/dev/null 2>&1 ;;
	*png|*jpg|*jpe|*jpeg|*gif)
		curl -sL "$url" > "/tmp/$(echo "$url" | sed "s/.*\///;s/%20/ /g")" && nsxiv -a "/tmp/$(echo "$url" | sed "s/.*\///;s/%20/ /g")"  >/dev/null 2>&1 & ;;
	*pdf|*cbz|*cbr)
		curl -sL "$url" > "/tmp/$(echo "$url" | sed "s/.*\///;s/%20/ /g")" && zathura "/tmp/$(echo "$url" | sed "s/.*\///;s/%20/ /g")"  >/dev/null 2>&1 & ;;
	*mp3|*flac|*opus|*mp3?source*)
		qndl "$url" 'curl -LO'  >/dev/null 2>&1 ;;
	*)
		[ -f "$url" ] && setsid -f "$TERMINAL" -e "$EDITOR" "$url" >/dev/null 2>&1 || setsid -f "$BROWSER" "$url" >/dev/null 2>&1
esac
