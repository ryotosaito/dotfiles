#!/usr/bin/env bash

REPODIR="$(cd $(dirname $0); pwd)"
cd $REPODIR

echo "DOTFILES=\"$REPODIR\"" > .dotfiles_path

for file in .bash_logout .bash_profile .bashrc .dotfiles_path .profile .rc .vimrc
do
	ln -is "$REPODIR/$file" "$HOME/$file"
done
