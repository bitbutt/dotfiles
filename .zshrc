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
if [ "${UID}" = 0 ]; then
    usercolor_primary="red"
    usercolor_accent="yellow"
else
    usercolor_primary="blue"
    usercolor_accent="magenta"
fi

PROMPT="%{$fg_no_bold[${usercolor_primary}]%}[%{$fg_no_bold[${usercolor_accent}]%}%m:%d%{$fg_no_bold[${usercolor_primary}]%}] >>> %{$reset_color%}"

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

# Bindkeys ####################################################################
bindkey -v # VIM-like key bindings

# Exports #####################################################################
export HISTFILE="${HOME}/.zsh_history"
export HISTSIZE="10000"
export SAVEHIST="${HISTSIZE}"

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
    builtin cd $@; ls
}
