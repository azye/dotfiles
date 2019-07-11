#!/bin/bash

CONFIG_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

mv ~/.bashrc ~/.bashrc.bak
mv ~/.bash_aliases ~/.bash_aliases.bak
mv ~/.vimrc ~/.vimrc.bak
mv ~/.git-completion.bash ~/.git-completion.bash.bak

ln -s $CONFIG_PATH/.bashrc ~/.bashrc
ln -s $CONFIG_PATH/.bash_aliases ~/.bash_aliases
ln -s $CONFIG_PATH/.vimrc ~/.vimrc
ln -s $CONFIG_PATH/.git-completion.bash ~/.git-completion.bash

. ~/.bashrc