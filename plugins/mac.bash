# macOS specific configurations

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
alias cat='bat'
alias maczip='zip -r output.zip . -x ".*" -x "__MACOSX"'
test -e "${PLUGIN_PATH}/iterm2.bash" && source "${PLUGIN_PATH}/iterm2.bash"
defaults write com.dteoh.SlowQuitApps delay -int 500 # slow quit apps delay
