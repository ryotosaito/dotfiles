source "$HOME/.profile"
source "$HOME/.bashrc"
[[ -e "$HOME/.dotfiles_path" ]] && source "$HOME/.dotfiles_path"

export HISTSIZE=3000
export PROMPT_DIRTRIM=3
export GIT_PS1_SHOWDIRTYSTATE=1

##############################################
# Bash completion for commands from homebrew
##############################################
[[ "$(uname -s)" == 'Darwin' ]] && command -v brew &>/dev/null && {
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
# iTerm2
##############################################
[[ -e "$HOME/.iterm2_shell_integration.bash" ]] && {
	source "$HOME/.iterm2_shell_integration.bash"
}
