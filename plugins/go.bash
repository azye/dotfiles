# golang

# checks if go is installed
if ! [ -x "$(command -v go)" ]; then
  echo 'Error: go plugin used, but go is not installed.' >&2
  return
fi

# make sure $GOPATH is set prior to adding this plug-in
export PATH=$PATH:$(go env GOPATH)bin
alias gtest='go test ./...'
