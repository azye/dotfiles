git config --global user.email "alexzye1@gmail.com"

WRKSP=/mnt/c/User/alexz/workspace
WHOM=/mnt/c/Users/alexz
CONFIG_PATH=`dirname $BASH_SOURCE`
PLUGIN_PATH=${CONFIG_PATH}/plugins

source ${PLUGIN_PATH}/base.bash
source ${PLUGIN_PATH}/git.bash
source ${PLUGIN_PATH}/git-completion.bash

alias subl='"/mnt/c/Program Files/Sublime Text 3/subl.exe"'
alias vi='vim'
alias resource='source ~/.profile'
alias home='cd ${WHOM}'
alias wrksp='cd ${WRKSP}'

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
