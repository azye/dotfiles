git config --global user.email "alexzye1@gmail.com"

alias resource='source ~/.bash_profile'

CONFIG_PATH=`dirname $BASH_SOURCE`
PLUGIN_PATH=${CONFIG_PATH}/plugins

source ${PLUGIN_PATH}/base.bash
source ${PLUGIN_PATH}/mac.bash
source ${PLUGIN_PATH}/git.bash
source ${PLUGIN_PATH}/git-completion.bash

export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad
