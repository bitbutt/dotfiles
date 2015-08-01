###############################################################################
# ~/.bashrc : bash configuration file                                         #
###############################################################################

[ -z "${PS1}" ] && return

# Settings ####################################################################
set -o braceexpand
set -o vi

shopt -s histappend
shopt -s extglob
shopt -s nullglob
shopt -s hostcomplete
shopt -s globstar
shopt -s dotglob

# Prompt ######################################################################
color_reset="$(tput sgr0)"

if [ "${UID}" = 0 ]; then
    usercolor_primary="$(tput setaf 1)"
    usercolor_accent="$(tput setaf 3)"
else
    usercolor_primary="$(tput setaf 4)"
    usercolor_accent="$(tput setaf 5)"
fi

PS1='${usercolor_primary}[${usercolor_accent}\h:${PWD}${usercolor_primary}] >>> ${color_reset}'

# Aliases #####################################################################
alias cp="cp -rv"
alias ls="ls --tabsize=0 --color=auto --human-readable --group-directories-first"
alias la="ls -A"
alias lal="ls -Al"
alias ll="ls -l"
alias rm="rm -vir"
alias sizes="du -a -BM --max-depth=1"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias :wq="exit"
alias :q="exit"

if [ "$(uname -o)" != "Cygwin" ]; then
    alias pingg="ping -c 3 google.com"
else
    alias pingg="ping -n 3 google.com"
fi

# Exports #####################################################################
export HISTFILE="${HOME}/.bash_history"
export HISTCONTROL="ignoreboth"
export HISTSIZE="10000"
export HISTFILESIZE="${HISTSIZE}"
export PROMPT_COMMAND="history -a"

USER_SCRIPT_PATH="${HOME}/projects/scripts"
ANDROID_PATH="/opt/android-sdk/platform-tools:/opt/android-sdk/build-tools/22.0.1"
GEM_PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin"

export EDITOR="vim"
export PAGER="less"
export PATH="${PATH}:${USER_SCRIPT_PATH}:${GEM_PATH}:${ANDROID_PATH}"
export TERM="screen-256color"

# Functions ###################################################################
cd()
{
    builtin cd "$@" && ls
}
