
if [[ -n "$WSL_DISTRO_NAME" ]]; then
	alias pbcopy='win32yank.exe'
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
alias mk='minikube'
alias resource='source ~/.bashrc'
alias python='python3'
alias py='python'
alias py2='python2'
alias py3='python3'
alias err='echo $?' # get last error code
alias path='echo -e ${PATH//:/\\n}'
alias g='git'
alias G='git'
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
alias vi='nvim'
alias vim='nvim'
alias v='nvim'
alias vimg='vim +Git +only'
alias notes='cd ~/notes'
alias dot='cd ~/dotfiles'
alias ws='cd ~/ws'
alias resource='. ~/.bash_profile'
alias tmux='tmux -2'
alias t='tmux -2'




# hacky way to get aliases
autocomplete_alias() {
	complete_output=$(complete -p $1)
	eval "${complete_output/ $1/""} $2"
}

autocomplete_alias git G
autocomplete_alias git g

