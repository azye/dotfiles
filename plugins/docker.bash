# docker

# check docker install
if ! [ -x "$(command -v docker)" ]; then
  echo 'Error: docker plugin used, but docker is not installed.' >&2
  return
fi

alias d='docker'

# check docker-compose install
if ! [ -x "$(command -v docker-compose)" ]; then
  echo 'Error: docker plugin used, but docker-compose is not installed.' >&2
  return
fi

alias dc='docker-compose'
alias dps='docker-compose ps'
alias dcrm='docker-compose rm'
alias dcr='docker-compose restart'
alias dcfr='docker-compose up --build --force-recreate'
