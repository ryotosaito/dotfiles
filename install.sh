#!/usr/bin/env bash

REPODIR="$(cd $(dirname $0); pwd)"
cd $REPODIR

set -x

echo "DOTFILES=\"$REPODIR\"" > .dotfiles_path

for file in .bash_profile .bashrc .dotfiles_path .profile .rc .vimrc
do
	ln -s "$REPODIR/$file" "$HOME/$file"
done
