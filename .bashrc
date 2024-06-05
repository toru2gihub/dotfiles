#!/bin/bash

# ▀█▀▄▀▄█▀▄█ █
#  █ ▀▄▀█▀▄▀▄█
# simple, clean, elegant
#
# Page: https://toru.codeberg.page/
# Mastodon: @averagetiger89
# Repository: https://codeberg.org/toru
# Email: torupublic11@waifu.club

#░░░░█▀▀▄░█▀▀▄░█▀▀░█░░░░█▀▀▄░█▀▄
#░▄▄░█▀▀▄░█▄▄█░▀▀▄░█▀▀█░█▄▄▀░█░░
#░▀▀░▀▀▀▀░▀░░▀░▀▀▀░▀░░▀░▀░▀▀░▀▀▀

# set -o vi       # vim-mode
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'
bind -s 'set completion-ignore-case on'

# EXPORT
## export all variables
set -o allexport

#░█▒█▒▄▀▄▒█▀▄░█▒▄▀▄░██▄░█▒░▒██▀░▄▀▀
#░▀▄▀░█▀█░█▀▄░█░█▀█▒█▄█▒█▄▄░█▄▄▒▄██
PATH="$HOME/.scripts":$PATH
TERMINAL="foot"
EDITOR="nvim"
VISUAL="nvim"
#FILE="lf"
IMAGEVIEWER="nsxiv"
MANPAGER="nvim +Man!"
READER="zathura"
PAGER="less"
BROWSER="firefox"
SUDO_ASKPASS="$HOME/.scripts/dmenupass"
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.zsh_history
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}
XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
HISTFILE="${XDG_STATE_HOME}"/bash/history
GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
#SUDO_ASKPASS=/usr/X11R6/bin/ssh-askpass
#SUDO_ASKPASS=/usr/X11R6/bin/ssh-askpass
PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

#▒▄▀▄░█▒░░█▒▄▀▄░▄▀▀▒██▀░▄▀▀
#░█▀█▒█▄▄░█░█▀█▒▄██░█▄▄▒▄██

## Coreutils ##
alias ls="ls -lhN --color=auto --group-directories-first"
alias la="ls -lahN --color=auto --group-directories-first"
alias cat='bat'
alias cp="cp -iv"
alias mv="mv -iv"
alias hist="history | fzf | xclip -sel c"
alias rm='shred -uzvn3'
alias mkdir="mkdir -pv"
alias xup='xrdb -load ~/.config/.Xresources'

## Git ##
alias gs="git status"
alias gw="git switch"
alias gb="git branch"
alias ga="git add ."
alias gc="git commit"
alias gp="git push -u"

## Programs ##
alias e="emacsclient -c -a 'emacs'"
alias x='nsxiv -t .'
alias v='nvim'
alias s='nsxiv'
alias txr="tmux source "~/.config/tmux/tmux.conf""
alias ncp='ncmpcpp'
alias ytd="yt-dlp --embed-metadata -i"
alias ffmpeg="ffmpeg -hide_banner"
alias yt='cd ~/dl; ytfzf -t -d'

## Not in use ##
#alias la='eza -la --icons --git --group-directories-first'
#alias ls='eza -l --icons --git --group-directories-first'
#alias rm="rm -vI"
#alias rem="killall emacs | /usr/bin/emacs --daemon"
#alias tb='nc termbin.com 9999'
#alias chafa='chafa -c full -s 40x40'
#alias h="history | cut -c 8- | sort | uniq | fzf | tr -d '\n' | xclip -selection c"

#▒█▀░█▒█░█▄░█░▄▀▀░▀█▀░█░▄▀▄░█▄░█░▄▀▀
#░█▀░▀▄█░█▒▀█░▀▄▄░▒█▒░█░▀▄▀░█▒▀█▒▄██
fcd() {
        cd "$(find -type d | fzf)"
}

# OTROS
stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTSIZE= HISTFILESIZE= # Infinite history.
ERRFILE="$XDG_CACHE_HOME/X11/xsession-errors"
# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion
blk='\[\033[01;30m\]'   # Black
red='\[\033[01;31m\]'   # Red
grn='\[\033[01;32m\]'   # Green
ylw='\[\033[01;33m\]'   # Yellow
blu='\[\033[01;34m\]'   # Blue
pur='\[\033[01;35m\]'   # Purple
cyn='\[\033[01;36m\]'   # Cyan
wht='\[\033[01;37m\]'   # White
clr='\[\033[00m\]'      # Reset
LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=00:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.avif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*~=00;90:*#=00;90:*.bak=00;90:*.crdownload=00;90:*.dpkg-dist=00;90:*.dpkg-new=00;90:*.dpkg-old=00;90:*.dpkg-tmp=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:*.swp=00;90:*.tmp=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90:';
export LS_COLORS
