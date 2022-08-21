#
# ~/.bash_profile
#

export GOPATH=~/go
export GOBIN=~/bin
export PATH=~/bin:$PATH
export EDITOR=vim
export VISUAL=vim
export TERM=xterm
export TERMINAL=xterm
export BROWSER=firefox
export LC_ALL=en_US.UTF-8
export FONTCONFIG_FILE=~/.fonts.conf

# shellcheck disable=1090
[[ -f ~/.bashrc ]] && . ~/.bashrc
