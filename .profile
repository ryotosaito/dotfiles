export EDITOR="vim"
export GOPATH="$HOME/go"
export NVM_DIR="$HOME/.nvm"

##############################################
# PATH
##############################################
PATH="$HOME/bin:$PATH"
PATH="$HOME/go/bin:$PATH"
PATH="$HOME/.cargo/bin:$PATH"

# MacOS
[[ "$(uname -s)" == 'Darwin' ]] && {
	# Commands installed via Homebrew
	PATH="/usr/local/opt/ruby/bin:$PATH"
	PATH="/usr/local/opt/mysql-client/bin:$PATH"

	# Use GNU commands as default
	PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
	PATH="/usr/local/opt/binutils/bin:$PATH"
	PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
	PATH="/usr/local/opt/gawk/libexec/gnubin:$PATH"
}

export PATH
