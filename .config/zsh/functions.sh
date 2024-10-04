#!/bin/sh

#▒█▀░█▒█░█▄░█░▄▀▀░▀█▀░█░▄▀▄░█▄░█░▄▀▀
#░█▀░▀▄█░█▒▀█░▀▄▄░▒█▒░█░▀▄▀░█▒▀█▒▄██

fcd() {

  cd "$(find ~/ -type d \( -path '*/\.git/*' -o -path ~/.local -o -path ~/.mozilla -o -path ~/.cache \) -prune -o -type d -print | fzf --border --tiebreak=index --margin=5% --info=inline --prompt="Select dir: " --preview='tree -C {} | head -n 40')"

}

fpf() {

    fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'
}

 frf() {
 command rm -rf $(command ls -a | fzf --multi --border --margin=3% --info=inline --prompt="Delete File: " --preview='tree -C {} | head -n 40')
 }

open() {

    xdg-open "$(find -type f | fzf)"
}
