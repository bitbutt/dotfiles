## About

This repository contains all of my dotfiles. A conglomeration of configuration!

## Installation

1. Copy/clone this repository to your desired install location (e.g. `~/dotfiles`).
2. (Optional) Modify the `DOTFILES` array in `bootstrap.sh` to configure where the symbolic links
   to the dotfiles will be created.
3. (Optional) Run `./bootstrap.sh clean` to remove any pre-existing symbolic links with names
   matching the dotfiles in this repository from your local environment. Regular files will not
   be modified or deleted.
4. Run `./bootstrap.sh install` to create symbolic links to the dotfiles. If a file/link already
   exists, the file/link will be skipped.

## (Un)license

These files are released into the public domain under the terms of [The Unlicense](https://raw.githubusercontent.com/bitbutt/dotfiles/master/UNLICENSE).
