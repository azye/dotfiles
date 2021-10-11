
# Load OS dependent variables
if [[ "$OSTYPE" == "linux-gnu" ]]; then
	alias subl='/mnt/c/Program\ Files/Sublime\ Text\ 3/subl.exe'
	alias ls='ls -lah --color=auto'
elif [[ "$OSTYPE" == "darwin"* ]]; then
	alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
	alias ls='ls -lahG'
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -lah --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#
# Symbol aliases
#
alias ~='cd ~'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

#
# common typos
#
alias cd..='cd ..'
alias q='exit'
alias c='clear'
alias h='history'
alias resource='source ~/.bashrc'
alias py='python'
alias py2='python2'
alias py3='python3'
alias err='echo $?' # get last error code
alias path='echo -e ${PATH//:/\\n}'
alias g='git'
alias gs='git status'
alias d='docker'
alias cdg='cd $GOPATH/src'
alias dc='docker-compose'
alias dps='docker-compose ps'
alias dcrm='docker-compose rm'
alias dcr='docker-compose restart'
alias dcfr='docker-compose up --build --force-recreate'
alias k='kubectl'
alias kl='kubectl logs'
alias kg='kubectl get'
alias kgp='kubectl get pod'
alias kgs='kubectl get service'
alias klf='kubectl logs -f'
alias rtv='rtv --enable-media'
