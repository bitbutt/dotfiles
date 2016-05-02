###############################################################################
# ~/.zshrc : zsh configuration file                                           #
###############################################################################

# Settings ####################################################################
autoload -U colors && colors
autoload -U compinit && compinit
autoload -U promptinit && promptinit
autoload -U zsh-mime-setup && zsh-mime-setup

setopt APPEND_HISTORY     # append history, don't overwrite
setopt CORRECT            # spellcheck
setopt HIST_IGNORE_DUPS   # no duplicate entries
setopt HIST_REDUCE_BLANKS # save hist space
setopt NO_BEEP            # disable beeps
setopt PROMPT_SUBST       # allow substitutions in prompt

# Prompt ######################################################################
color_reset="%{$reset_color%}"

if [ "${UID}" = 0 ]; then
    usercolor_primary="%{$fg_no_bold[magenta]%}"
    usercolor_accent="%{$fg_bold[magenta]%}"
else
    usercolor_primary="%{$fg_no_bold[cyan]%}"
    usercolor_accent="%{$fg_bold[cyan]%}"
fi

PROMPT="${usercolor_primary}[%m:${usercolor_accent}%d${usercolor_primary}] >>> ${color_reset}"

# Aliases #####################################################################
alias cp="cp -rv"
alias ls="ls --tabsize=0 --color=auto --human-readable --group-directories-first"
alias la="ls -A"
alias lal="ls -Al"
alias ll="ls -l"
alias livestreamer="livestreamer -p 'mpv --cache 8192 --title LiveStreamer'"
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

# Bindkeys ####################################################################
bindkey -v # VIM-like key bindings

# Exports #####################################################################
export HISTFILE="${HOME}/.zsh_history"
export HISTSIZE="10000"
export SAVEHIST="${HISTSIZE}"
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
    builtin cd $@; ls
}
