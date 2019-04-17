
# Load OS dependent variables
if [[ "$OSTYPE" == "linux-gnu" ]]; then
	alias subl='/mnt/c/Program\ Files/Sublime\ Text\ 3/subl.exe'
	alias ls='ls -lah --color=auto'
elif [[ "$OSTYPE" == "darwin"* ]]; then
	alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
	alias ls='ls -lahG'
fi


alias q='exit'
alias c='clear'
alias h='history'
alias g='grep'

alias resource='source ~/.bashrc'
alias ws='cd ${WORKSPACE}'
alias py='python'
alias py2='python2'
alias py3='python3'
alias err='echo $?' # get last error code
alias path='echo -e ${PATH//:/\\n}'
alias grep='grep --color=auto'

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


if [ -x "$(command -v docker)" ]; then
	alias d='docker'	
fi

if [ -x "$(command -v docker-compose)" ]; then
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
