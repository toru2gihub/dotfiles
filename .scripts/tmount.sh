#!/usr/bin/env sh

# ▀█▀▄▀▄█▀▄█ █
#  █ ▀▄▀█▀▄▀▄█
#  simple, clean, elegant
#
# Page: https://toru.codeberg.page/
# Mastodon: @averagetiger89
# Repository: https://codeberg.org/toru
# Email: torupublic11@waifu.club

#  _                               _         _     
# | |_ _ __ ___   ___  _   _ _ __ | |_   ___| |__  
# | __| '_ ` _ \ / _ \| | | | '_ \| __| / __| '_ \ 
# | |_| | | | | | (_) | |_| | | | | |_ _\__ \ | | |
#  \__|_| |_| |_|\___/ \__,_|_| |_|\__(_)___/_| |_|

#############################################
# Select and open a tomb (look at the path) #
#############################################

TOMB_DIR="$HOME/dc/tomb/"
KEY_FILE="$TOMB_DIR/secret.key"

ACTION=$(echo -e "🕯️ Raise the dead (open)\n🪦 Rest in peace (close)\n🔮 Tomb Slam All" | fzf --prompt="Choose your action: ")

if [ "$ACTION" == "🕯️ Raise the dead (open)" ]; then
    TOMB_FILE=$(find "$TOMB_DIR" -type f -name "*.tomb" | fzf --prompt="Select a tomb to open: ")
    if [ -n "$TOMB_FILE" ]; then
        echo "🔓 Opening the crypt..."
        tomb open "$TOMB_FILE" ~/pu -k "$KEY_FILE"
    else
        echo "No tomb selected. Returning to the crypt."
    fi
elif [ "$ACTION" == "🪦 Rest in peace (close)" ]; then
    echo "🔒 Sealing the tomb..."
    tomb close
elif [ "$ACTION" == "🔮 Tomb Slam All" ]; then
    echo "🔒 Slamming all tombs shut..."
    tomb slam all
else
    echo "No action selected. The spirits remain restless."
fi
