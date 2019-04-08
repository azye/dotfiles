#!/bin/bash

CONFIG_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ -f ~/.bashrc ]; then
	mv ~/.bashrc ~/.bashrc.bak
fi

if [ -f ~/.bash_aliases ]; then
	mv ~/.bash_aliases ~/.bash_aliases.bak
fi

ln -s $CONFIG_PATH/.bashrc ~/.bashrc
ln -s $CONFIG_PATH/.bash_aliases ~/.bash_aliases

source ~/.bashrc