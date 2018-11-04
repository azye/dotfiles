
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
alias wrksp='cd ${WRKSP}'
alias cat='bat'

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
