#! /bin/bash

cat >> bashrc_standalone << EOF
# for history search
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# for increament history
shopt -s histappend
EOF


echo input command in shell: "alias | sed 's/^/alias &/' >> bashrc_standalone"
