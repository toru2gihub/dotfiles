#!/bin/sh

#   __     __ 
#  / _|___/ _|
# | ||_  / |_ 
# |  _/ /|  _|
# |_|/___|_|  

# Use the CLI find to get all files, excluding any filepath
# containing the string "git".
export FZF_DEFAULT_COMMAND='find . -type f ! -path "*git*"'

# Use the CLI fd to respect ignore files (like '.gitignore'),
# display hidden files, and exclude the '.git' directory.
export FZF_DEFAULT_COMMAND='fd . --hidden --exclude ".git"'

# Use the CLI ripgrep to respect ignore files (like '.gitignore'),
# display hidden files, and exclude the '.git' directory.
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'

# GRUVBOX FZF
 export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=fg:#d0d0d0,fg+:#d0d0d0,bg:-1,bg+:-1

--color=hl:#83a598,hl+:#458588,info:#689d6a,marker:#d79921

--color=prompt:#cc241d,spinner:#cc241d,pointer:#cc241d,header:#87afaf

--color=border:#282828,label:#ebdbb2,query:#ebdbb2

--preview-window="border-double"

--prompt="> "

--marker=">"

--pointer="λ"

--separator="."

--scrollbar="│"'
