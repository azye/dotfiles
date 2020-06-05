# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

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


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -lah --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

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

export PYENV_ROOT=~/.pyenv

export PIPENV_PYTHON=$PYENV_ROOT/shims/python

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

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

if [[ -x "$(command -v fortune)" ]]; then
	printf "\n"
	fortune
	printf "\n"
fi

cd ~

# for fun
# if [[ -x "$(command -v fortune)" ]] && [[ -x "$(command -v cowsay)" ]] && [[ -x "$(command -v lolcat)" ]]; 
# then
# 	fortune | cowsay | lolcat
# fi
