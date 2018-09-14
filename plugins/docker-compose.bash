# docker-compose
if ! [ -x "$(command -v docker-compose)" ]; then
  echo 'Error: docker-compose plugin used, but command is not installed.' >&2
  return
fi

alias dc='docker-compose'
alias dcrm='docker-compose rm'
alias dps='docker-compose ps'
alias dcr='docker-compose restart'
alias dcfr='docker-compose up --build --force-recreate'
