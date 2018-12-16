
WHOM=/mnt/c/Users/alexz
WRKSP=${WHOM}/workspace
CONFIG_PATH=`dirname $BASH_SOURCE`
PLUGIN_PATH=${CONFIG_PATH}/plugins

source ${CONFIG_PATH}/local.wsl_ubuntu.bash #hidden to public
source ${PLUGIN_PATH}/base.bash
source ${PLUGIN_PATH}/git.bash
source ${PLUGIN_PATH}/git-completion.bash

alias subl='"/mnt/c/Program Files/Sublime Text 3/subl.exe"'
alias vi='vim'
alias resource='source ~/.profile'
alias home='cd ${WHOM}'
alias ~='cd ${WHOM}'
alias ws='cd ${WRKSP}'

export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"

PATH=$(/usr/bin/printenv PATH | /usr/bin/perl -ne 'print join(":", grep { !/\/mnt\/[a-z]/ } split(/:/));')
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi