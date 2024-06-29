. "$HOME/.profile"
. "$HOME/.bashrc"
[[ -e "$HOME/.dotfiles_path" ]] && . "$HOME/.dotfiles_path"


export GIT_PS1_SHOWDIRTYSTATE=1

##########################################################
# Bash completion and other stuffs for homebrew formulae
##########################################################
[[ "$(uname -s)" == 'Darwin' ]] && command -v brew &>/dev/null && {
	[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
	[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

	# brew install bash-completion
	[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

	# completions from other formulae
	HOMEBREW_PREFIX="$(brew --prefix)"
	if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
		. "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
	else
		for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
			[[ -r "$COMPLETION" ]] && . "$COMPLETION"
		done
	fi
}

##############################################
# NVM for Linux
##############################################
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

##############################################
# Bash completion for Linux
##############################################
if ! shopt -oq posix; then
	if [ -f /etc/profile.d/bash_completion.sh ]; then
		. /etc/profile.d/bash_completion.sh
	elif [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

