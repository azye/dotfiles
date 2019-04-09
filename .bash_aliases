
# Load OS dependent variables
if [[ "$OSTYPE" == "linux-gnu" ]]; then
	alias subl='/mnt/c/Program\ Files/Sublime\ Text\ 3/subl.exe'
fi

alias h="history | grep "
alias f="find . | grep "
alias grep='grep --color=auto'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias resource='source ~/.bashrc'
alias q='exit'
alias ~='cd ${HOME}'
alias ws='cd ${WORKSPACE}'
alias ~='cd ~'
alias c='clear'
alias ..='cd ..'
alias py='python'
alias h='history'
alias cd..='cd ..'
alias err='echo $?' # get last error code
alias path='echo -e ${PATH//:/\\n}'
alias ls='ls -lah --color=auto'
alias grep='grep --color=auto'

if [ -x "$(command -v docker)" ]; then
	alias d='docker'
	alias dc='docker-compose'
	alias dps='docker-compose ps'
	alias dcrm='docker-compose rm'
	alias dcr='docker-compose restart'
	alias dcfr='docker-compose up --build --force-recreate'
fi

# check kubectl install
if [ -x "$(command -v kubectl)" ]; then
	alias k='kubectl'
	alias kl='kubectl logs'
	alias kg='kubectl get'
	alias kgp='kubectl get pod'
	alias kgs='kubectl get service'
fi

# checks for minikube install
if [ -x "$(command -v minikube)" ]; then
	alias mk='minikube'
	alias mkdash='minikube dashboard &> /dev/null &' # opens up k8s dashboard in the background
	alias mks='minikube service --https' # expects service name
	alias mkenv='eval $(minikube docker-env)' # loads the minikube docker environment
fi
