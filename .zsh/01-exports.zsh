export HISTFILE=~/.histfile
export HISTSIZE=10000
export SAVEHIST=10000

ANDROID_PATH="/opt/android-sdk/platform-tools:/opt/android-sdk/build-tools/20.0.0"
GEM_PATH="`ruby -rubygems -e 'puts Gem.user_dir'`/bin"

export ARCH="x86_64"
export BROWSER="firefox"
export EDITOR="vim"
export PAGER="/bin/sh -c \"col -b -x | vim -R -c 'set ft=man nomod nolist' -\""
export PATH="${PATH}:${HOME}/code/scripts:${ANDROID_PATH}:${GEM_PATH}"
export PRINTER="Miles_Printer"
export TERM="screen-256color"
export XZ_OPT="-9"
