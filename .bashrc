# Load in bash_env
if [ -f ~/.bash_env ]; then
	. ~/.bash_env
fi

# Load bash alias file
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi


# $PS1 configurations settings
#
# example: 08:19 PM alex /mnt/c/Users/alexz/workspace/dotfiles (master)
#
BLUE='\[\033[94m\]'
GREEN='\[\033[0;32m\]'
RED='\[\033[91m\]'
WHITE='\[\033[00m\]'

# \@ time HH:MM AM/PM
# \u user
# \w current directory
export PS1="${GREEN}\@ \u ${BLUE}\w${RED}\$(parse_git_branch)\n${WHITE}\$ "

# gets name of current git repository
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
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
# Git config settings
#
git config --global core.editor "${EDITOR}"
git config --global user.email "${EMAIL}"
git config --global user.name "${IRL_NAME}"

#
# Golang config settings
#
if [ -x "$(command -v go)" ]; then
	export GOPATH=${WORKSPACE}/go

	# if Go installed and $GOPATH does not exist, create default $GOPATH in workspace
	if ! [ -d "$GOPATH" ]; then
		echo "Configured \$GOPATH does not exists. Creating directory $GOPATH"
		mkdir -p $GOPATH
	fi
fi

#
# OS specific config settings
#

# if linux
if [[ "$OSTYPE" == "linux-gnu" ]]; then
	echo "logging in with linux-gnu settings"

	export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
	export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
	export LDFLAGS="-L/home/linuxbrew/.linuxbrew/opt/isl@0.18/lib"
	export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/isl@0.18/include"
	
	eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

	export PATH=$(/usr/bin/printenv PATH | /usr/bin/perl -ne 'print join(":", grep { !/\/mnt\/[a-z]/ } split(/:/));')
	# Added by n-install (see http://git.io/n-install-repo).
	export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"
# else if macOS
elif [[ "$OSTYPE" == "darwin" ]]; then
	echo "logging in with darwin settings"
	WORKSPACE=/Volumes/CaseSensitive

	[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
	
	test -e "${PLUGIN_PATH}/iterm2.bash" && source "${PLUGIN_PATH}/iterm2.bash"
	defaults write com.dteoh.SlowQuitApps delay -int 500 # slow quit apps delay
else
	echo "uhhh I'm not sure what this is"
fi

#
# Print data
#
echo "\$WORKSPACE: ${WORKSPACE}"
echo "\$GOPATH:    ${GOPATH}"
echo "\$PATH:      ${PATH}"

if [ -x "$(command -v neofetch)" ]; then
	printf '\n'
	neofetch
fi
printf '\n'

cd $WORKSPACE
