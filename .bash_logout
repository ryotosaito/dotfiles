source "$HOME/.dotfiles_path"
[[ -z "$DOTFILES" ]] && exit

cd $DOTFILES

# Commit and push "M"odified changes
git status -s | grep '^.M' &>/dev/null && {
	echo '[.bash_logout] update on dotfiles! commiting...'
	git add $(git status -s | grep '^.M' | cut -c4- | xargs -L1 -I@ printf "%q\n" "@")
	git commit -S -m "update on $(date +'%Y/%m/%d %H:%M:%S')"
	git push
}
