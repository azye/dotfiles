#!/bin/bash
CONFIG_PATH=`dirname $BASH_SOURCE`
echo $CONFIG_PATH

if [ -f ~/.bashrc ]; then
	mv ~/.bashrc ~/.bashrc.bak
fi

if [ -f ~/.bash_aliases ]; then
	mv ~/.bash_aliases ~/.bash_aliases.bak
fi

if [ -f ~/.bash_env ]; then
	mv ~/.bash_env ~/.bash_env.bak
fi

ln -s $CONFIG_PATH/.bashrc ~/.bashrc
ln -s $CONFIG_PATH/.bash_aliases ~/.bash_aliases

source ~/.bashrc