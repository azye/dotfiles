#!/bin/bash

CONFIG_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

DOT_FILES=(".bashrc" ".bash_aliases" ".vimrc" ".git_completion")

for file in "${DOT_FILES[@]}"; 
do
	if test -f ~/"${file}"; then
		rm ~/"${file}"
	fi

	ln -s "${CONFIG_PATH}"/"${file}" ~/"${file}"
done

. ~/.bashrc
