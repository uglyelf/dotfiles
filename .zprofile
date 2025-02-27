
eval "$(/opt/homebrew/bin/brew shellenv)"

# Get your current public IP
alias ip="curl icanhazip.com"

# git completion
source ~/git-completion.bash

# ls better
alias ls='ls -G'
alias la="ls -aF"
alias ld="ls -ld"
alias ll="ls -lahL"
alias lt='ls -At1 && echo "------Oldest--"'
alias ltr='ls -Art1 && echo "------Newest--"'
alias con="tail -40 -f /var/log/system.log"

# adb better
alias apks="adb shell 'pm list packages -f' | sed -e 's/.*=//' | sort"

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash

alias rmdd="rm -rf ~/Library/Developer/Xcode/DereivedData/"


