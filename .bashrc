# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Load in bash_env
[ -f ~/.bash_env ] && . ~/.bash_env
[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.git_completion ] && . ~/.git_completion
[ -f ~/.fzf.bash ] && . ~/.fzf.bash
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -x "$(command -v kubectl)" ] && . <(kubectl completion bash) # kubectl bash completion
[ -x "$(command -v pyenv)" ] && eval "$(pyenv init -)" # enable pyenv


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

# append to the history file, don't overwrite it
shopt -s histappend

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

set -o noclobber # add confirmation for clobbering files
export EDITOR=vim # set default editor
export HISTSIZE=5000 # max number of lines stored in memory by terminal session
export HISTFILESIZE=6000 # max number of lines allowed to be stored on history file
export HISTCONTROL=ignoreboth # don't put duplicate lines or lines starting with space in the history.
export PYENV_ROOT=~/.pyenv
export PIPENV_PYTHON=$PYENV_ROOT/shims/python
export DOCKER_BUILDKIT=1
export LANG=C

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

#
# OS specific config settings
#
if [[ "$OSTYPE" == "linux-gnu" ]]; then
	eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
# elif [[ "$OSTYPE" == "darwin"* ]]; then
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

# run this at the very end. i don't want to replace the entire shell with tmux,
# just run it at the beginning.
# only run if not already in a tmux session
if ! { [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; } then
	tmux
fi
