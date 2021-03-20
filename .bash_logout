source "$HOME/.dotfiles_path"
[[ -z "$DOTFILES" ]] && exit

cd $DOTFILES

# Commit and push "M"odified changes
git status -s | grep '^.M' &>/dev/null && {
	echo '[.bash_logout] update on dotfiles! commiting...'
	git add $(git status -s | grep '^.M' | cut -c4- | xargs -I@ printf "%q\n" "@")
	git commit -m "update on $(date +'%Y/%m/%d %H:%M:%S')"
	git push
}

if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi
