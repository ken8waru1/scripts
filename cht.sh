#!/usr/bin/env bash

languages=$(echo "golang c cpp javascript typescript rust" | tr " " "\n")
core_utils=$(echo "find xargs sed awk" | tr " " "\n")

selected=$(echo -e "$languages\n$core_utils" | fzf)

read -rp "QUERY: " query

if echo "$languages" | grep -qs "$selected"; then
	curl -s cht.sh/"$selected"/"$(echo "$query" | tr " " "+")" | less
else
	curl -s cht.sh/"$selected"/"$(echo "$query" | tr " " "~")" | less
fi
