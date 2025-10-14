# =============================================================================
# SHELL COMPATIBILITY CHECK
# =============================================================================
# Detect which shell is being used and configure shell-specific settings
# This ensures the config works with both bash and zsh

# Check if we're running in zsh
if [[ -n "${ZSH_VERSION:-}" ]]; then
    # Zsh-specific settings
    autoload -U compinit && compinit  # Initialize zsh completion system
    setopt AUTO_CD                   # Auto cd when typing directory names
    setopt HIST_IGNORE_DUPS          # Don't store duplicate history entries
    setopt HIST_IGNORE_SPACE         # Don't store commands starting with space
    setopt SHARE_HISTORY             # Share history between all zsh sessions
elif [[ -n "${BASH_VERSION:-}" ]]; then
    # Bash-specific settings
    shopt -s histappend             # Append to history file instead of overwriting
    shopt -s autocd                 # Auto cd when typing directory names
fi

# =============================================================================
# COLOR DEFINITIONS
# =============================================================================
# Define ANSI color codes for terminal output
# Format: \033[XXm where XX is the color code
BLUE='\[\033[94m\]'      # Blue color for directory in prompt
GREEN='\[\033[0;32m\]'   # Green color for time and user in prompt
RED='\[\033[0;31m\]'     # Red color (available for use)
YELLOW='\[\033[0;33m\]'  # Yellow color for git branch in prompt
RESET='\[\033[00m\]'     # Reset color to default

# =============================================================================
# PROMPT CONFIGURATION
# =============================================================================
# Custom prompt format: TIME [USER] DIRECTORY (GIT_BRANCH)
# \@ = time in 12-hour format (HH:MM AM/PM)
# \u = username
# \w = current working directory
# \$(parse_git_branch) = calls function to show git branch
# \n = newline
# \$ = prompt character ($ for user, # for root)
export PS1="${GREEN}\@ [\u] ${BLUE}\w ${YELLOW}\$(parse_git_branch) \n${RESET}\$ "

# =============================================================================
# GIT BRANCH FUNCTION
# =============================================================================
# Function to display current git branch in prompt
# Returns empty string if not in a git repository
parse_git_branch() {
	# git branch: list all branches
	# 2> /dev/null: suppress error output (if not in git repo)
	# sed -e '/^[^*]/d': delete lines that don't start with *
	# sed -e 's/* \(.*\)/(\1)/': replace "* branch_name" with "(branch_name)"
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# =============================================================================
# ENVIRONMENT VARIABLES
# =============================================================================
# Set default editor for system and git operations
export EDITOR=nvim        # Default text editor for system
export GIT_EDITOR=nvim    # Default text editor for git operations

# History configuration
export HISTSIZE=5000      # Number of commands to remember in current session
export HISTFILESIZE=6000  # Number of commands to save to history file
export HISTCONTROL=ignoreboth  # Ignore duplicate commands and commands starting with space

# Shell behavior
set -o noclobber          # Prevent accidental overwriting of files with >

# =============================================================================
# BASH COMPLETION SETUP
# =============================================================================
# Load bash completion system for command-line tab completion
# Different paths for macOS (Homebrew) vs Linux
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS: Check both Intel and Apple Silicon Homebrew paths
    [ -r "/usr/local/etc/profile.d/bash_completion.sh" ] && . "/usr/local/etc/profile.d/bash_completion.sh"  # Intel Mac
    [ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"  # Apple Silicon
else
    # Linux: Standard system path
    [ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
fi

# =============================================================================
# NODE VERSION MANAGER (NVM)
# =============================================================================
# Load NVM if installed - allows switching between Node.js versions
export NVM_DIR="$HOME/.nvm"                    # Set NVM directory
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # Load NVM if it exists
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # Load NVM completion if it exists

# =============================================================================
# ALIASES
# =============================================================================
# Load bash aliases for consistent behavior across login and non-login shells
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# =============================================================================
# COLOR SUPPORT AND ALIASES
# =============================================================================
# Configure colors for ls, grep, and other commands
# Different approaches for macOS vs Linux
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS: Use native color support
    export CLICOLOR=1                                    # Enable colors in Terminal.app
    export LSCOLORS=ExFxBxDxCxegedabagacad              # Color scheme for ls (directories, files, etc.)
    alias ls='ls -lah'                                   # List with human-readable sizes, show hidden files
    alias grep='grep --color=auto'                      # Enable colors in grep output
else
    # Linux: Use dircolors system for advanced color configuration
    if type -P dircolors >/dev/null; then
        # Load custom dircolors if available, otherwise use system defaults
        [[ -f ~/.dir_colors ]] && eval $(dircolors -b ~/.dir_colors)      # User custom colors
        [[ -f /etc/DIR_COLORS ]] && eval $(dircolors -b /etc/DIR_COLORS)  # System default colors
    fi
    alias ls='ls -lah --color=auto'                     # List with colors and human-readable sizes
    alias grep='grep --colour=auto'                     # Enable colors in grep output
fi

# Additional grep aliases for colored output
alias egrep='egrep --colour=auto'                       # Extended grep with colors
alias fgrep='fgrep --colour=auto'                       # Fixed-string grep with colors

# =============================================================================
# FZF (FUZZY FINDER) INTEGRATION
# =============================================================================
# Load FZF for fuzzy file searching and command history
# Provides Ctrl+T (file search), Ctrl+R (history search), Alt+C (directory change)
[ -f ~/.fzf.bash ] && . ~/.fzf.bash  # Load user's custom FZF configuration

# Load FZF key bindings and completion based on OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS: Check both Intel and Apple Silicon Homebrew paths
    [ -f /usr/local/opt/fzf/shell/key-bindings.bash ] && . /usr/local/opt/fzf/shell/key-bindings.bash      # Intel Mac
    [ -f /usr/local/opt/fzf/shell/completion.bash ] && . /usr/local/opt/fzf/shell/completion.bash          # Intel Mac
    [ -f /opt/homebrew/opt/fzf/shell/key-bindings.bash ] && . /opt/homebrew/opt/fzf/shell/key-bindings.bash  # Apple Silicon
    [ -f /opt/homebrew/opt/fzf/shell/completion.bash ] && . /opt/homebrew/opt/fzf/shell/completion.bash    # Apple Silicon
else
    # Linux: Standard system paths
    [ -f /usr/share/doc/fzf/examples/key-bindings.bash ] && . /usr/share/doc/fzf/examples/key-bindings.bash    # Key bindings
    [ -f /usr/share/doc/fzf/examples/completion.bash ] && . /usr/share/doc/fzf/examples/completion.bash          # Tab completion
fi

# =============================================================================
# GIT COMPLETION
# =============================================================================
# Load Git command completion for better git workflow
# Provides tab completion for git commands, branches, remotes, etc.
[ -f ~/.git-completion.bash ] && . ~/.git-completion.bash  # Load user's custom git completion

# Load system git completion based on OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS: Check both Intel and Apple Silicon Homebrew paths
    [ -f /usr/local/etc/bash_completion.d/git-completion.bash ] && . /usr/local/etc/bash_completion.d/git-completion.bash      # Intel Mac
    [ -f /opt/homebrew/etc/bash_completion.d/git-completion.bash ] && . /opt/homebrew/etc/bash_completion.d/git-completion.bash  # Apple Silicon
else
    # Linux: Standard system path
    [ -f /usr/share/bash-completion/completions/git ] && . /usr/share/bash-completion/completions/git  # System git completion
fi

