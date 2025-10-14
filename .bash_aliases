# =============================================================================
# BASH ALIASES
# =============================================================================
# Cross-platform aliases for Ubuntu and macOS
# Organized by category for better maintainability

# =============================================================================
# SHELL NAVIGATION ALIASES
# =============================================================================
alias ~='cd ~'                    # Go to home directory
alias ..='cd ..'                  # Go up one directory
alias ...='cd ../..'              # Go up two directories
alias ....='cd ../../..'          # Go up three directories
alias .....='cd ../../../..'      # Go up four directories

# =============================================================================
# COMMON TYPOS AND SHORTCUTS
# =============================================================================
alias cd..='cd ..'                # Fix common typo
alias q='exit'                    # Quick exit
alias c='clear'                   # Clear screen
alias h='history'                 # Show command history
alias resource='source ~/.bashrc' # Reload bashrc
alias err='echo $?'               # Show last exit code
alias path='echo -e ${PATH//:/\\n}' # Show PATH in readable format

# =============================================================================
# PYTHON ALIASES
# =============================================================================
alias python='python3'            # Use python3 as default
alias py='python3'               # Short python
alias py2='python2'              # Python 2
alias py3='python3'              # Python 3

# =============================================================================
# GIT ALIASES
# =============================================================================
alias g='git'                     # Short git
alias G='git'                     # Alternative short git
alias gs='git status'             # Git status
alias ga='git add'                # Git add
alias gc='git commit'             # Git commit
alias gp='git push'               # Git push
alias gl='git pull'               # Git pull
alias gd='git diff'               # Git diff
alias gb='git branch'             # Git branch
alias gco='git checkout'          # Git checkout

# =============================================================================
# DOCKER ALIASES
# =============================================================================
alias d='docker'                  # Short docker
alias dc='docker-compose'         # Docker compose
alias dps='docker-compose ps'     # Docker compose status
alias dcrm='docker-compose rm'    # Docker compose remove
alias dcr='docker-compose restart' # Docker compose restart
alias dcfr='docker-compose up --build --force-recreate' # Docker compose force recreate

# =============================================================================
# KUBERNETES ALIASES
# =============================================================================
alias k='kubectl'                 # Short kubectl
alias kl='kubectl logs'           # Kubectl logs
alias kg='kubectl get'            # Kubectl get
alias kgp='kubectl get pods'      # Kubectl get pods
alias kgs='kubectl get services'  # Kubectl get services
alias klf='kubectl logs -f'       # Kubectl logs follow

# =============================================================================
# EDITOR ALIASES
# =============================================================================
alias vi='nvim'                   # Use nvim instead of vi
alias vim='nvim'                  # Use nvim instead of vim
alias v='nvim'                    # Short nvim
alias vimg='nvim +Git +only'      # Nvim with git integration

# =============================================================================
# DIRECTORY ALIASES
# =============================================================================
alias notes='cd ~/notes'          # Go to notes directory
alias dot='cd ~/dotfiles'         # Go to dotfiles directory
alias ws='cd ~/ws'                # Go to workspace directory
alias cdg='cd $GOPATH/src'        # Go to Go source directory (if GOPATH is set)

# =============================================================================
# TERMINAL ALIASES
# =============================================================================
alias tmux='tmux -2'              # Tmux with 256 colors
alias t='tmux -2'                 # Short tmux
alias mk='minikube'               # Minikube shortcut

# =============================================================================
# CROSS-PLATFORM CLIPBOARD ALIASES
# =============================================================================
# WSL (Windows Subsystem for Linux) clipboard support
if [[ -n "$WSL_DISTRO_NAME" ]]; then
    alias pbcopy='win32yank.exe'   # WSL clipboard copy
    alias pbpaste='win32yank.exe -o --lf' # WSL clipboard paste
fi

# macOS clipboard support (if not in WSL)
if [[ "$OSTYPE" == "darwin"* && -z "$WSL_DISTRO_NAME" ]]; then
    alias pbcopy='pbcopy'          # macOS clipboard copy
    alias pbpaste='pbpaste'        # macOS clipboard paste
fi

# Linux clipboard support (if not in WSL)
if [[ "$OSTYPE" == "linux-gnu"* && -z "$WSL_DISTRO_NAME" ]]; then
    # Try xclip first, then xsel as fallback
    if command -v xclip >/dev/null 2>&1; then
        alias pbcopy='xclip -selection clipboard'
        alias pbpaste='xclip -selection clipboard -o'
    elif command -v xsel >/dev/null 2>&1; then
        alias pbcopy='xsel --clipboard --input'
        alias pbpaste='xsel --clipboard --output'
    fi
fi

# =============================================================================
# ALIAS COMPLETION SETUP
# =============================================================================
# Function to set up completion for git aliases
autocomplete_alias() {
    # Get completion function for the original command
    local complete_output=$(complete -p $1 2>/dev/null)
    if [[ -n "$complete_output" ]]; then
        # Apply the same completion to the alias
        eval "${complete_output/ $1/""} $2"
    fi
}

# Set up completion for git aliases
autocomplete_alias git g
autocomplete_alias git G
autocomplete_alias docker d
autocomplete_alias docker-compose dc
autocomplete_alias kubectl k