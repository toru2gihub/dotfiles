#!/bin/sh

# ▀█▀▄▀▄█▀▄█ █
#  █ ▀▄▀█▀▄▀▄█
#  simple, clean, elegant
#
# Page: https://toru.codeberg.page/
# Mastodon: @averagetiger89
# Repository: https://codeberg.org/toru
# Email: torupublic11@waifu.club

# usage: word count

# handle position arguments
if [ $# -ne 1 ]
then
    echo "Usage: $0 filename"
    exit -1
fi

# realize word count
printf "%-14s%s\n" "Word" "Count"

cat $1 | tr 'A-Z' 'a-z' | \
egrep -o "\b[[:alpha:]]+\b" | \
awk '{ count[$0]++ }
END{
for(ind in count)
{ printf("%-14s%d\n",ind,count[ind]); }
}' | sort -k2 -n -r | head -n 10

