if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_env ]; then
    . ~/.bash_env
fi

##########################################################
BLUE='\[\033[94m\]'
GREEN='\[\033[0;32m\]'
RED='\[\033[91m\]'
WHITE='\[\033[00m\]'
export PS1="${GREEN}\@ \u ${BLUE}\w${RED}\$(parse_git_branch)\n${WHITE}\$ "
export EDITOR=vim

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	echo "logging in with linux-gnu settings"
	C=/mnt/c
	WORKSPACE=${C}/Users/alexz/workspace

	# export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
	export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
	export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
	export LDFLAGS="-L/home/linuxbrew/.linuxbrew/opt/isl@0.18/lib"
	export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/isl@0.18/include"
	
	eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

	export PATH=$(/usr/bin/printenv PATH | /usr/bin/perl -ne 'print join(":", grep { !/\/mnt\/[a-z]/ } split(/:/));')
	# Added by n-install (see http://git.io/n-install-repo).
	export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"
elif [[ "$OSTYPE" == "darwin" ]]; then
	echo "logging in with darwin settings"
	WORKSPACE=/Volumes/CaseSensitive

	[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
	
	test -e "${PLUGIN_PATH}/iterm2.bash" && source "${PLUGIN_PATH}/iterm2.bash"
	defaults write com.dteoh.SlowQuitApps delay -int 500 # slow quit apps delay
else
	echo "uhhh I'm not sure what this is"
fi

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

git config --global core.editor "${EDITOR}"
git config --global user.email "${EMAIL}"
git config --global user.name "${IRL_NAME}"

# checks for Golang installation
if [ -x "$(command -v go)" ]; then
	export GOPATH=${WORKSPACE}/go

	if ! [ -d "$GOPATH" ]; then
		echo "Configured \$GOPATH does not exists. Creating directory $GOPATH"
		mkdir -p $GOPATH
	fi
fi

# # add confirmation for clobbering files
set -o noclobber
# # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

echo "\$WORKSPACE: ${WORKSPACE}"
echo "\$GOPATH:    ${GOPATH}"
echo "\$PATH:      ${PATH}"

if [ -x "$(command -v neofetch)" ]; then
	printf '\n'
	neofetch
fi
printf '\n'

cd $WORKSPACE
