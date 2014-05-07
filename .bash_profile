echo "sourcing the boxen environment variables"
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
 
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
export VIRTUALENVWRAPPER_PYTHON='/opt/boxen/homebrew/bin/python2.7'
[ -f /opt/boxen/homebrew/share/python/virtualenvwrapper.sh ] && source /opt/boxen/homebrew/share/python/virtualenvwrapper.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#PATH=PATH$:/sbin:/bin:/usr/bin:/opt/local/bin


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

# ls better
alias ls='ls -G'
alias la="ls -aF"
alias ld="ls -ld"
alias ll="ls -l"
alias lt='ls -At1 && echo "------Oldest--"'
alias ltr='ls -Art1 && echo "------Newest--"'
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
alias digicharm='cd ~/src/dark-horse-digital; workon digital; source .env; charm'
