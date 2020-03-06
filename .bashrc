printf "Logging into: ${OSTYPE}\n"

# Load in bash_env
if [[ -f ~/.bash_env ]]; then
	. ~/.bash_env
fi

# Load bash alias file
if [[ -f ~/.bash_aliases ]]; then
	. ~/.bash_aliases
fi

# Load git autocomplete
if [[ -f ~/.git_completion ]]; then
	. ~/.git_completion
fi

# $PS1 configurations settings
#
# example: 09:28 PM [alex] ~/.dotfiles (master)
#
BLUE='\[\033[94m\]'
GREEN='\[\033[0;32m\]'
RED='\[\033[0;31m\]'
WHITE='\[\033[00m\]'
YELLOW='\[\033[0;33m\]'
BLACK='\[\033[0;30m\]'
PURPLE='\[\033[0;35m\]'
CYAN='\[\033[0;36m\]'
WHITE='\[\033[0;37m\]'

# # \@ time HH:MM AM/PM
# # \u user
# # \w current directory
export PS1="${GREEN}\@ [\u] ${BLUE}\w ${YELLOW}\$(parse_git_branch) \n${WHITE}\$ "

# gets name of current git repository
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# set default editor
export EDITOR=vim
# add confirmation for clobbering files
set -o noclobber
# max number of lines stored in memory by terminal session
export HISTSIZE=5000
# max number of lines allowed to be stored on history file
export HISTFILESIZE=6000
# don't put duplicate lines or lines starting with space in the history.
export HISTCONTROL=ignoreboth

#
# OS specific config settings
#
if [[ "$OSTYPE" == "linux-gnu" ]]; then
	eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
elif [[ "$OSTYPE" == "darwin"* ]]; then
	# else if macOS
	[[ -f /usr/local/etc/bash_completion ]] && . /usr/local/etc/bash_completion
else
	echo "uhhh I'm not sure what this is"
fi

# if Go installed and $GOPATH does not exist, create default $GOPATH in workspace
if [[ -x "$(command -v go)" ]]; then
	# if GOPATH is initialized, and GOPATH doesnt exist
	if [[ ! -z "${GOPATH}" ]] && [[ ! -d "${GOPATH}" ]]; then
		echo "Configured \$GOPATH does not exists: $GOPATH"
	elif [[ -z "${GOPATH}" ]]; then
		echo "No \$GOPATH set"
	else
		# add GOPATH bin to PATH
		export PATH="$PATH:${GOPATH}/bin"
	fi
fi

# kubectl bash completion
[[ -x "$(command -v kubectl)" ]] && . <(kubectl completion bash)

# enable pyenv
[[ -x "$(command -v pyenv)" ]] && eval "$(pyenv init -)"

[[ -x "$(command -v docker)" ]] && export DOCKER_BUILDKIT=1

# for fun
if [[ -x "$(command -v fortune)" ]] && [[ -x "$(command -v cowsay)" ]] && [[ -x "$(command -v lolcat)" ]]; 
then
	fortune | cowsay | lolcat
fi
