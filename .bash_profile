# I don't use boxen anymore
# echo "sourcing the boxen environment variables"
# [ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
 
echo "enabling bash completion"
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export HISTFILESIZE=100000
export HISTSIZE=100000 
# export HISTIGNORE="ls*:rm*:cd*:CD*:ps*:exit*:reset*:clear*:synaptic*:mkdir*:cat*"
export HISTCONTROL=ignoreboth
shopt -s histappend
## export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

PS1="\W 🌞   "
export PROMPT_COMMAND='echo -ne "\033]0;\007"'
[ -f /Users/gregoryr/.django_bash_completion ] && source /Users/gregoryr/.django_bash_completion
echo "setting up virtualenv"
export VIRTUALENVWRAPPER_PYTHON='/usr/local/bin/python'
export WORKON_HOME=~/.virtualenv
export PATH=$PATH:/usr/local/mysql/bin
[ -f /usr/local/bin/virtualenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#PATH=PATH$:/sbin:/bin:/usr/bin:/opt/local/bin

export PATH="$PATH:~/Development/android-sdk-macosx/platform-tools:~/Development/android-sdk-macosx/tools:"

export PATH=~/Development/flutter/bin:$PATH

# LSCOLORS="DxGxFxdxCxdxdxhbadExEx"
LSCOLORS=gxfxcxdxbxegedabagacad
export LSCOLORS

if [ "$UID" = "0" ];
then
  # I am root
  COLOR2="\[\033[1;31m\]"
fi

ALERT=${BWhite}${On_Red} # Bold White on red background

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

export EDITOR="vi"
export CLICOLOR=1
export XCODE="`xcode-select --print-path`"

trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash

alias dungeoncharm='cd ~/src/dungeon; workon dungeon; charm'
alias hdjmp='heroku run --app dhd ./manage.py'

alias rmdd="rm -rf ~/Library/Developer/Xcode/DereivedData/"

# export JAVA_HOME=$(/usr/libexec/java_home)
# export JDK_HOME=$(/usr/libexec/java_home)


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/gregoryr/.sdkman"
[[ -s "/Users/gregoryr/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/gregoryr/.sdkman/bin/sdkman-init.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/gregoryr/Downloads/google-cloud-sdk/path.bash.inc ]; then
  source '/Users/gregoryr/Downloads/google-cloud-sdk/path.bash.inc'
fi
