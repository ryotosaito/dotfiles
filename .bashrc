source "$HOME/.rc"

set -o vi

##############################################
# Prompt
##############################################
export PROMPT_COMMAND=__prompt_command
__prompt_command() {
	local status=$?
	local reset='\e[m'
	local uline='\e[4m'
	local fblack='\e[30m'
	local fred='\e[31m'
	local fgreen='\e[32m'
	local fblue='\e[34m'
	local bgreen='\e[42m'
	local -A err_code=(
		[1]=error
		[2]='builtin error'
		[126]='not executable'
		[127]='command not found'
		[128]=SIGHUP
		[129]=SIGINT
		[130]=SIGQUIT
		[131]=SIGILL
		[132]=SIGTRAP
		[133]=SIGABRT
		[134]=SIGEMT
		[135]=SIGFPE
		[136]=SIGKILL
		[137]=SIGBUS
		[138]=SIGSEGV
		[139]=SIGSYS
		[140]=SIGPIPE
		[141]=SIGALRM
		[142]=SIGTERM
		[143]=SIGURG
		[144]=SIGSTOP
		[145]=SIGTSTP
		[146]=SIGCONT
		[147]=SIGCHLD
		[148]=SIGTTIN
		[149]=SIGTTOU
		[150]=SIGIO
		[151]=SIGXCPU
		[152]=SIGXFSZ
		[153]=SIGVTALRM
		[154]=SIGPROF
		[155]=SIGWINCH
		[156]=SIGINFO
		[157]=SIGUSR1
		[158]=SIGUSR2
	)
	PS1="\[$fgreen\]\u\[$reset\]@\[$fblue\]\w\[$reset\] "
	PS1+="$(command -v __git_ps1 >/dev/null && __git_ps1 "\[$fblack$bgreen\] git@%s \[$reset\]") "
	PS1+="\[$uline\]\D{%Y/%m/%d %H:%M:%S}\[$reset\] "
	PS1+="$(if [[ $status -eq 0 ]]; then printf 🎉; else printf "💥 \[$fred\]%d(%s)\[$reset\]" $status "${err_code[$status]}"; fi)\n"
	PS1+='[\!:\#] (´-\`).oO(\$ '

	# From activate script of python3-venv
	if [ "`basename \"$VIRTUAL_ENV\"`" = "__" ] ; then
		# special case for Aspen magic directories
		# see http://www.zetadev.com/software/aspen/
		PS1="[`basename \`dirname \"$VIRTUAL_ENV\"\``] $PS1"
	elif [[ -n $VIRTUAL_ENV ]] ; then
		PS1="(`basename \"$VIRTUAL_ENV\"`)$PS1"
	fi
	export PS1
}

##############################################
# Use X11 on Docker (MacOS)
##############################################
# ref: https://github.com/chanezon/docker-tips/blob/master/x11/README.md#proxying
[[ "$(uname -s)" == 'Darwin' ]] && {
	export DISPLAY_MAC=`ifconfig en0 | grep "inet " | cut -d " " -f2`:0
	function startx() {
		if [ -z "$(ps -ef|grep XQuartz|grep -v grep)" ] ; then
			open -a XQuartz
			socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &
		fi
	}
}
