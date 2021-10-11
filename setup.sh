#!/bin/bash
set -x
CONFIG_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

DOT_FILES=(".bashrc" ".bash_aliases" ".vimrc" ".git_completion" ".tmux.conf")

for file in "${DOT_FILES[@]}"; 
do
	rm ~/"${file}"

	ln -s "${CONFIG_PATH}"/"${file}" ~/"${file}"
done

. ~/.bashrc
