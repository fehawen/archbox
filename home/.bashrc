#
# ~/.bashrc
#

# shellcheck disable=1090,1091

[[ $- != *i* ]] && return

HISTCONTROL=ignoreboth

shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

[[ $DISPLAY ]] && shopt -s checkwinsize

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    PS1='\[\033[1;30m\]\W\[\033[00m\] \[\033[1;31m\]\$\[\033[00m\] '
else
    PS1='\W \$ '
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*) PS1="\[\e]0;\u@\h: \w\a\]$PS1" ;;
    *) ;;
esac

if [ -x /usr/bin/dircolors ]; then
    if test -r ~/.dircolors; then
        eval "$(dircolors -b ~/.dircolors)"
    else
        eval "$(dircolors -b)"
    fi

    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias la='ls -AF1'
alias ll='ls -lAFGh | less -R'
alias gs='git status'
alias gc='git commit'
alias gp='git push'

[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
