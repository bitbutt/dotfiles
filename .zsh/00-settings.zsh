autoload -U colors && colors
autoload -U compinit && compinit
autoload -U promptinit && promptinit
autoload -U zsh-mime-setup && zsh-mime-setup

setopt APPEND_HISTORY     # append history, don't overwrite
setopt CORRECT            # spellcheck
setopt HIST_IGNORE_DUPS   # no duplicate entries
setopt HIST_REDUCE_BLANKS # save hist space
setopt NO_BEEP            # disable beeps
