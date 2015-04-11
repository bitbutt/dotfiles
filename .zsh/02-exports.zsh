export HISTFILE=~/.histfile
export HISTSIZE=10000
export SAVEHIST=10000

ANDROID_PATH="/opt/android-sdk/platform-tools:/opt/android-sdk/build-tools/21.1.2"
GEM_PATH="`ruby -rubygems -e 'puts Gem.user_dir'`/bin"
CABAL_PATH="${HOME}/.cabal/bin"

export ARCH="x86_64"
export BROWSER="firefox"
export EDITOR="vim"
export PAGER="/bin/sh -c \"col -b -x | vim -R -c 'set ft=man nomod nolist' -\""
export PATH="${PATH}:${HOME}/code/scripts:${ANDROID_PATH}:${GEM_PATH}:${CABAL_PATH}"
export PRINTER="Miles_Printer"
export TERM="screen-256color"
export XZ_OPT="-9"
