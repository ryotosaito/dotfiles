#!/usr/bin/env bash

print_help() {
	cat <<-EOS
	$0: install dotfiles to your home directory

	OPTION:
	  -h, --help: print help
	  -i, --init: initial install (install VundleVim and Plugins)
	EOS
}

while getopts hi-: OPT
do
	case $OPT in
		h)
			print_help
			exit
			;;
		i)
			INIT_FLAG=1
			;;
		-)
			case $OPTARG in
				help)
					print_help
					exit
					;;
				init)
					INIT_FLAG=1
					;;
			esac
			;;
	esac
done
shift $(($OPTIND - 1))

[[ -v INIT_FLAG ]] && {
	mkdir -p "$HOME/.vim/colors"
	wget -P "$HOME/.vim/colors/" https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
	mkdir -p "$HOME/.vim/bundle/"
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
}

REPODIR="$(cd $(dirname $0); pwd)"
cd $REPODIR

echo "DOTFILES=\"$REPODIR\"" > .dotfiles_path

for file in .bash_logout .bash_profile .bashrc .dotfiles_path .inputrc .profile .rc .screenrc .tmux.conf .vimrc
do
	ln -is "$REPODIR/$file" "$HOME/$file"
done
