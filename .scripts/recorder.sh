#!/bin/sh

# ▀█▀▄▀▄█▀▄█ █
#  █ ▀▄▀█▀▄▀▄█
#  simple, clean, elegant
#
# Page: https://toru.codeberg.page/
# Mastodon: @averagetiger89
# Repository: https://codeberg.org/toru
# Email: torupublic11@waifu.club

# ░█▀▀▄░█▀▀░█▀▄░▄▀▀▄░█▀▀▄░█▀▄░█▀▀░█▀▀▄
# ░█▄▄▀░█▀▀░█░░░█░░█░█▄▄▀░█░█░█▀▀░█▄▄▀
# ░▀░▀▀░▀▀▀░▀▀▀░░▀▀░░▀░▀▀░▀▀░░▀▀▀░▀░▀▀

psid=$(pgrep wf-recorder)
# [ -z $psid ] && wf-recorder -f $HOME/$(date +'recording_%Y-%m-%d-%H%M.mp4') || pkill --signal SIGINT wf-recorder

is_recording() {
    [ -z $psid ] && wf-recorder -f $HOME/dl/$(date +'recording_%Y-%m-%d-%H%M%S.mp4') || pkill --signal SIGINT wf-recorder
}

notify() {
    [ -z $psid ] && notify-send "Recording screen" "Act natural dude..." || notify-send "Video recorded" "video was stored in your Downloads..."
}
