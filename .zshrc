# ▀█▀▄▀▄█▀▄█ █
#  █ ▀▄▀█▀▄▀▄█
# simple, clean, elegant
#
# Page: https://toru.codeberg.page/
# Mastodon: @averagetiger89
# Repository: https://codeberg.org/toru
# Email: torupublic11@waifu.club

#          _             
#  ___ ___| |_   _ _  __ 
# |_ /(_-/|   \ | '_|/ _|
# /__|/__/|_||_||_|  \__|

#░▄▀▀▒██▀░▀█▀░▀█▀░█░█▄░█░▄▀▒░▄▀▀
#▒▄██░█▄▄░▒█▒░▒█▒░█░█▒▀█░▀▄█▒▄██
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

## CURSOR
echo -e -n "\x1b[\x35 q" # vertical line blinking

autoload -U colors && colors # Load colors

autoload -Uz add-zsh-hook
setopt prompt_subst
add-zsh-hook precmd vcs_info
PROMPT='%(?.%F{blue}λ.%F{9}λ)%f %2~ '
# Run the `vcs_info` hook to grab git info before displaying the prompt
add-zsh-hook precmd vcs_info

# Style the vcs_info message
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats '%b%u%c'
# Format when the repo is in an action (merge, rebase, etc)
zstyle ':vcs_info:git*' actionformats '%F{14}⏱ %*%f'
zstyle ':vcs_info:git*' unstagedstr '*'
zstyle ':vcs_info:git*' stagedstr '+'
# This enables %u and %c (unstaged/staged changes) to work,
# but can be slow on large repos
zstyle ':vcs_info:*:*' check-for-changes true

# Set the right prompt to the vcs_info message
RPROMPT='⎇ ${vcs_info_msg_0_}'

# newline=$'\n'
# set_prompt() {
#     if [[ $UID -eq 0 ]]; then
#         # PROMPT='%1 %F{cyan}%/%f%F{blue}${vcs_info_msg_0_}%f%b ${newline}%F{red}❯❯ %f'
# 	#PROMPT='%B%1~%b %F{011}λ %f'
#         PROMPT='%F{red} λ %f'
#         RPROMPT='%F{magenta}%~%f%F{magenta}${vcs_info_msg_0_}%f'
#     else
#         # PROMPT='%1 %F{cyan}%/%f%F{blue}${vcs_info_msg_0_}%f%b ${newline}%F{blue}❯❯ %f'
#         PROMPT='%F{yellow} λ %f'
#         RPROMPT='%F{green}%~%f%F{red}${vcs_info_msg_0_}%f'
#     fi
# }
# set_prompt
# precmd() {
#     set_prompt
# }

## CTRL+ARROW KEYS
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

## CASE INSENSITIVE COMPLETION
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

## AUTO-TAB-COMPLETION
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit_comp_options+=(globdots)		# Include hidden files.

## AUTOMATICALLY CD INTO TYPED DIRECTORY
setopt autocd		

# DISABLE CTRL-S TO FREEZE TERMINAL
stty stop undef		

setopt interactive_comments
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

## EXPORT ALL VARIABLES
set -o allexport

#░█▒█▒▄▀▄▒█▀▄░█▒▄▀▄░██▄░█▒░▒██▀░▄▀▀
#░▀▄▀░█▀█░█▀▄░█░█▀█▒█▄█▒█▄▄░█▄▄▒▄██
TERMINAL="foot"
#EDITOR="emacsclient -c -a 'emacs'"
#VISUAL="emacsclient -c -a 'emacs'"
EDITOR="nvim"
VISUAL="nvim"
#FILE="lf"
BROWSER="firefox"
IMAGEVIEWER="nsxiv"
READER="zathura"
PAGER="less"
HISTSIZE=10000000
SAVEHIST=10000000
HISTDUP=erase
HISTFILE="$HOME/.local/share/.zsh_history"
PATH="$HOME/.scripts":$PATH
SUDO_ASKPASS="$HOME/.scripts/dmenupass.sh"
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}
XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
#MANPAGER="dmenuman +Man!"
#MANPAGER="nvim +Man!"
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

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:#ffffff,bg:-1,hl:#d79921 --color=fg+:#ffffff,bg+:#262626,hl+:#ffd700 --color=info:#afaf87,prompt:#d79921,pointer:#d79921 --color=marker:#87ff00,spinner:#ffd700,header:#87afaf'

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

## Nix ##
alias store="nix-store --query --requisites /run/current-system | cut -d- -f2- | sort | uniq"

## Git ##
alias gts="git status"
alias gw="git switch"
alias gl="git log --oneline | fzf --preview 'git show --name-only {1}'" #commit history
alias gb="git branch"
alias ga="git add ."
alias gc="git commit"
alias gp="git push -u"

## Programs ##
alias e="emacsclient -c -a 'emacs'"
alias x='nsxiv -t .'
alias v='nvim'
alias th='theme.sh -i'
alias rs='rsync -vuP'
alias s='nsxiv'
alias txr="tmux source "~/.config/tmux/tmux.conf""
alias ncp='ncmpcpp'
alias ytd="yt-dlp --embed-metadata -i"
alias ffmpeg="ffmpeg -hide_banner"
alias yt='cd ~/dl; ytfzf -t -d'
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

#▒█▀▄░█▒░░█▒█░▄▀▒░█░█▄░█░▄▀▀
#░█▀▒▒█▄▄░▀▄█░▀▄█░█░█▒▀█▒▄██
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=00:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.avif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*~=00;90:*#=00;90:*.bak=00;90:*.crdownload=00;90:*.dpkg-dist=00;90:*.dpkg-new=00;90:*.dpkg-old=00;90:*.dpkg-tmp=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:*.swp=00;90:*.tmp=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90:';
export LS_COLORS 

theme.sh gruvbox-dark-hard

if command -v theme.sh > /dev/null; then
    [ -e ~/.theme_history ] && theme.sh "$(theme.sh -l|tail -n1)"
fi

source <(fzf --zsh)
