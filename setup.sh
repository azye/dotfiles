#!/bin/bash
set -x
CONFIG_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

DOT_FILES=("bash_profile" "bashrc" "bash_aliases" "profile" "bash_env" "vimrc" "tmux.conf")


mkdir ~/.dotfile.bak

for file in "${DOT_FILES[@]}"; 
do
	[[ -f ~/."${file}" ]] && cp ~/."${file}" ~/.dotfile.bak
done

for file in "${DOT_FILES[@]}"; 
do
 	rm ~/."${file}"
	
	ln -s "${CONFIG_PATH}"/"${file}" ~/."${file}"
done

. ~/.bashrc
