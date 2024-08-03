#!/bin/sh

#▒▄▀▄░█▒░░█▒▄▀▄░▄▀▀▒██▀░▄▀▀
#░█▀█▒█▄▄░█░█▀█▒▄██░█▄▄▒▄██

## Coreutils ##
#alias ls="ls -lhN --color=auto --group-directories-first"
#alias la="ls -lahN --color=auto --group-directories-first"
alias la='eza -la --icons --git --group-directories-first'
alias ls='eza -l --icons --git --group-directories-first'
alias cat='bat'
alias cp="cp -iv"
alias mv="mv -iv"
alias srm='shred -uzvn3'
alias mkdir="mkdir -pv"
alias xup='xrdb -load ~/dotfiles/.Xdefaults'
alias fbat='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'

## Nix ##
alias store="nix-store --query --requisites /run/current-system | cut -d- -f2- | sort | uniq"

## Git ##
alias gst="git status"
alias gw="git switch"
alias gl="git log --oneline | fzf --preview 'git show --name-only {1}'" #commit history
alias glog='git log --graph --topo-order --pretty='\''%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N'\'' --abbrev-commit'
alias gb="git branch"
alias ga="git add ."
alias gc="git commit"
alias gp="git push -u"

## Programs ##
alias e="emacsclient -c -a 'emacs'"
alias x="nsxiv -t ."
alias v="nvim"
alias zj="zellij"
alias ff="fastfetch"
alias rs="rsync -vuP"
alias s="nsxiv"
alias ncp="ncmpcpp"
alias ytd="cd ~/dl; yt-dlp --embed-metadata -i"
alias ffmpeg="ffmpeg -hide_banner"
alias yt="cd ~/dl; ytfzf -t -d"
alias tb="nc termbin.com 9999" #antes del "tb", usa | (pipe)

## Pacman ##
#alias pacr="pacman -Qq | fzf --multi --preview 'pacman -Qi {2}' | xargs -ro sudo pacman -Rncs"
#alias pacs='pacman -Slq | fzf --multi --preview '\''pacman -Si {1}'\'' | xargs -ro sudo pacman -S'
#alias yays='yay -Slq | fzf --multi --preview '\''yay -Si {1}'\'' | xargs -ro yay --sudo sudo --sudoflags -- --save -S'
#alias yayr="yay -Qq | fzf --multi --preview 'yay -Qi {1}' | xargs -ro yay --sudo sudo --sudoflags -- --save -Rncs"
#alias pacsyu='sudo pacman -Syu'

## Not in use ##
#alias rm="rm -vI"
#alias rem="killall emacs | /usr/bin/emacs --daemon"
#alias chafa='chafa -c full -s 40x40'
#alias h="history | cut -c 8- | sort | uniq | fzf | tr -d '\n' | xclip -selection c"
