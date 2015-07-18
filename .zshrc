###############################################################################
# ~/.zshrc : Z shell configuration file                                       #
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
if [ ${UID} = 0 ]; then
    usercolor_primary="red"
    usercolor_accent="yellow"
else
    usercolor_primary="blue"
    usercolor_accent="magenta"
fi

PROMPT="%{$fg_no_bold[${usercolor_primary}]%}[%{$fg_no_bold[${usercolor_accent}]%}${HOST}:%d%{$fg_no_bold[${usercolor_primary}]%}] >>> %{$reset_color%}"

# Aliases #####################################################################
alias cp="cp -rv"
alias htop="htop -s PERCENT_MEM"
alias la="ls -A"
alias lal="ls -Al"
alias ll="ls -l"
alias ls="ls --tabsize=0 --color=auto --human-readable --group-directories-first"
alias mount="sudo mount"
alias pinga="ping -c 3 archlinux.org"
alias pingg="ping -c 3 google.com"
alias reboot="sudo reboot"
alias rm="rm -vir"
alias shutdown="sudo shutdown -h +0"
alias sizes="du -a -BM --max-depth=1"
alias umount="sudo umount"
alias upgrade="sudo pacman -Syu"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias :wq="exit"
alias :q="exit"

# Bindkeys ####################################################################
bindkey -v # VIM-like key bindings

# Exports #####################################################################
export HISTFILE=~/.histfile
export HISTSIZE=10000
export SAVEHIST=10000

ANDROID_PATH="/opt/android-sdk/platform-tools:/opt/android-sdk/build-tools/22.0.1"
GEM_PATH="`ruby -rubygems -e 'puts Gem.user_dir'`/bin"
CABAL_PATH="${HOME}/.cabal/bin"

export ARCH="x86_64"
export BROWSER="firefox"
export EDITOR="vim"
export PAGER="less"
export PATH="${PATH}:${HOME}/projects/scripts:${ANDROID_PATH}:${GEM_PATH}:${CABAL_PATH}"
export TERM="screen-256color"
export XZ_OPT="-9"

# Functions ###################################################################
cd()
{
    builtin cd $@; ls
}
