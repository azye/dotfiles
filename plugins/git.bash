# git
if ! [ -x "$(command -v git)" ]; then
  echo 'Error: git plugin used, but git is not installed.' >&2
  return
fi

alias gstatus='git status'
alias gcheckout='git checkout'
alias greset='git reset'
alias gstash='git stash'
