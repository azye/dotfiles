
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
alias vi='vim'
