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
    usercolor_primary="${color_reset}$(tput setaf 5)"
    usercolor_accent="${color_reset}$(tput setaf 5)$(tput bold)"
else
    usercolor_primary="${color_reset}$(tput setaf 6)"
    usercolor_accent="${color_reset}$(tput setaf 6)$(tput bold)"
fi

PS1='${usercolor_primary}[\h:${usercolor_accent}${PWD}${usercolor_primary}] >>> ${color_reset}'

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
export EDITOR="vim"
export PAGER="less"
export TERM="screen-256color"

# Path ########################################################################
USER_SCRIPT_PATH="${HOME}/projects/scripts"
ANDROID_PLATFORM_PATH="/opt/android-sdk/platform-tools"
ANDROID_BUILD_PATH="/opt/android-sdk/build-tools/22.0.1"
CONDA_PATH="${HOME}/.miniconda/bin"

for d in "${USER_SCRIPT_PATH}" "${ANDROID_PLATFORM_PATH}" "${ANDROID_BUILD_PATH}" "${CONDA_PATH}"; do
    if [ -d "${d}" ]; then
        export PATH="${PATH}:${d}"
    fi
done

# Functions ###################################################################
cd()
{
    builtin cd "$@" && ls
}
