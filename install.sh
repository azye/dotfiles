#!/bin/bash

if type "apt" > /dev/null; then
	echo "installing packages with apt..."
	apt update && apt upgrade
	apt install -y neovim tmux fzf fd-find ripgrep man	
elif type "pacman" > /dev/null; then
	echo "installing packages with pacman..."
	pacman -S neovim tmux fd man nodejs npm fzf fd ripgrep
fi

echo "done."
