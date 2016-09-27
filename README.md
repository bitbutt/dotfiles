## About

This repository contains all of my dotfiles. A conglomeration of configuration!

## Installation

1. Run `git clone --recursive` to install this repository to your desired location (e.g. `~/.dotfiles`).
2. Copy the example configuration file `.dotfiles.conf` to your home directory and edit
   the `DOTFILES` array to only inlude the dotfiles you want to install.
3. Run `./bootstrap.sh install` to create symbolic links to the dotfiles. Existing files will
   be skipped.
4. Run `./bootstrap.sh clean` to remove any symbolic links with names matching the dotfiles
   in `.dotfiles.conf` from your local environment. Regular files will be skipped.

## (Un)license

These files are released into the public domain under the terms of [The Unlicense](https://raw.githubusercontent.com/bytebutt/dotfiles/master/UNLICENSE).
