source "$HOME/.profile"
source "$HOME/.bashrc"
[[ -e "$HOME/.dotfiles_path" ]] && source "$HOME/.dotfiles_path"


export GIT_PS1_SHOWDIRTYSTATE=1

##############################################
# Bash completion for commands from homebrew
##############################################
[[ "$(uname -s)" == 'Darwin' ]] && command -v brew &>/dev/null && {
	# brew install bash-completion
	[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && source "/usr/local/etc/profile.d/bash_completion.sh"

	# completions from other formulae
	HOMEBREW_PREFIX="$(brew --prefix)"
	if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
		source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
	else
		for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
			[[ -r "$COMPLETION" ]] && source "$COMPLETION"
		done
	fi
}

##############################################
# Bash completion for Linux
##############################################
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
