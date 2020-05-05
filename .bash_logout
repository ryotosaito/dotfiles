source "$HOME/.dotfiles_path"
[[ -z "$DOTFILES" ]] && exit

cd $DOTFILES

# Commit and push "M"odified changes
git status -s | grep '^.M' &>/dev/null && {
	echo '[.bash_logout] update on dotfiles! commiting...'
	# The command below does not consider files including spaces
	git add $(git status -s | grep '^.M' | awk '{print $2}')
	git commit -m "update on $(date +'%Y/%m/%d %H:%M:%S')"
	git push
}
