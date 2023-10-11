#!/bin/bash
set -x
CONFIG_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

DOT_FILES=(".bash_profile" ".bashrc" ".bash_aliases" ".profile" ".vimrc" ".tmux.conf")

mkdir ~/.dotfile.bak

for file in "${DOT_FILES[@]}"; 
do
	[[ -f ~/"${file}" ]] && cp ~/"${file}" ~/.dotfile.bak
done

cp ~/.config/nvim/init.vim ~/.dotfile.bak

for file in "${DOT_FILES[@]}"; 
do
 	rm ~/"${file}"
	
	ln -s "${CONFIG_PATH}"/"${file}" ~/"${file}"
done

mkdir -p ~/.config/nvim
ln -s "${CONFIG_PATH}"/init.vim ~/.config/nvim/init.vim

. ~/.bashrc
