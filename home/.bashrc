#
# ~/.bashrc
#

[[ $- != *i* ]] && return

HISTCONTROL=ignoreboth

shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

[[ $DISPLAY ]] && shopt -s checkwinsize

PROMPT_DIRTRIM=3

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    PS1='\[\033[01;33m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \[\033[01;31m\]\$\[\033[00m\] '
else
    PS1='\u@\h \w \$ '
fi

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

# shellcheck disable=1090
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
