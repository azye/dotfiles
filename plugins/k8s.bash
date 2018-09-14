# kubernetes

# sources kubectl autocompletion
source <(kubectl completion bash)

# check kubectl install
if ! [ -x "$(command -v kubectl)" ]; then
  echo 'Error: k8s plugin used, but kubectl is not installed.' >&2
  return
fi

alias k='kubectl'
alias kg='kubectl get'
alias kgp='kubectl get pod'
alias kgs='kubectl get service'

# checks for minikube install
if ! [ -x "$(command -v minikube)" ]; then
  echo 'Error: k8s plugin used, but minikube is not installed.' >&2
  return
fi

alias mk='minikube'
alias mkd='minikube dashboard'
alias mks='minikube service --https'
alias mkinit='minikube start --mount-string=".:/tally-core" --mount --network-plugin=cni --vm-driver="hyperkit" --bootstrapper=kubeadm --kubernetes-version=v1.11.0 && eval $(minikube docker-env)'
alias mkenv='eval $(minikube docker-env)'



