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

## EXPORT ALL VARIABLES
set -o allexport

#░█▒█▒▄▀▄▒█▀▄░█▒▄▀▄░██▄░█▒░▒██▀░▄▀▀
#░▀▄▀░█▀█░█▀▄░█░█▀█▒█▄█▒█▄▄░█▄▄▒▄██
PROMPT='%(?.%F{red}λ.%F{9}λ)%f %2~ '
TERMINAL="foot"
EDITOR="emacsclient -c -a 'emacs'"
VISUAL="emacsclient -c -a 'emacs'"
# EDITOR="nvim"
# VISUAL="nvim"
FILE="yazi"
BROWSER="firefox"
IMAGEVIEWER="nsxiv"
READER="zathura"
PAGER="less"
HISTSIZE=10000000
SAVEHIST=10000000
HISTDUP=erase
HISTFILE="$HOME/.local/share/.zsh_history"
PATH="$HOME/.scripts":$PATH
#SUDO_ASKPASS="$HOME/.scripts/tofipass.sh"
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}
XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
#MANPAGER="nvim +Man!"
#MANPAGER="sh -c 'col -bx | bat -l man -p'"
#SUDO_ASKPASS=/usr/X11R6/bin/ssh-askpass
XDG_DESKTOP_DIR="$HOME/dk"
XDG_DOCUMENTS_DIR="$HOME/dc"
XDG_DOWNLOAD_DIR="$HOME/dl"
XDG_MUSIC_DIR="$HOME/ms"
XDG_PICTURES_DIR="$HOME/pic"
XDG_PUBLICSHARE_DIR="$HOME/pu"
XDG_TEMPLATES_DIR="$HOME/tem"
XDG_VIDEOS_DIR="$HOME/vd"

# Use the CLI find to get all files, excluding any filepath
# containing the string "git".
export FZF_DEFAULT_COMMAND='find . -type f ! -path "*git*"'

# Use the CLI fd to respect ignore files (like '.gitignore'),
# display hidden files, and exclude the '.git' directory.
export FZF_DEFAULT_COMMAND='fd . --hidden --exclude ".git"'

# Use the CLI ripgrep to respect ignore files (like '.gitignore'),
# display hidden files, and exclude the '.git' directory.
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'

# DRACULA FZF
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
'

# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#   --color=fg:#d0d0d0,fg+:#d0d0d0,bg:-1,bg+:-1

#   --color=hl:#5f87af,hl+:#5fd7ff,info:#afaf87,marker:#87ff00

#   --color=prompt:#d90000,spinner:#d90000,pointer:#d90000,header:#87afaf

#   --color=border:#262626,label:#aeaeae,query:#d9d9d9

#   --preview-window="border-double"

#   --prompt="> "

#   --marker=">"

#   --pointer="λ"

#   --separator="."

#   --scrollbar="│"'

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
alias hist="history | fzf | xclip -sel c"
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

#▒█▀░█▒█░█▄░█░▄▀▀░▀█▀░█░▄▀▄░█▄░█░▄▀▀
#░█▀░▀▄█░█▒▀█░▀▄▄░▒█▒░█░▀▄▀░█▒▀█▒▄██

fcd() {

  cd "$(find ~/ -type d \( -path '*/\.git/*' -o -path ~/.local -o -path ~/.mozilla -o -path ~/.cache -o -path ~/dc/books \) -prune -o -type d -print | fzf --border --margin=5% --info=inline --prompt="Select dir: " --preview='tree -C {} | head -n 40')"

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
