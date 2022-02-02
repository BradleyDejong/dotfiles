#!/usr/bin/env bash

languages=$(echo "golang c cpp typescript rust javascript python java" | tr " " "\n")
core_utils=$(echo "find xargs sed awk grep tmux tr bc" | tr " " "\n")
selected=$(echo "$languages $core_utils" | tr " " "\n" | fzf)

read -p "Query: " query

if echo "$languages" | grep -qs $selected; then
  tmux split-window -h bash -c "curl cht.sh/$selected/$(echo  "$query" | tr " " "+") | less -R"
else
  tmux split-window -h bash -c "curl cht.sh/$selected~$(echo  "$query" | tr " " "+") | less -R"
fi
