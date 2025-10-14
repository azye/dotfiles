#!/bin/bash

# Dotfiles Installer
# Cross-platform dotfiles installation script
# Compatible with macOS (Homebrew) and Linux (apt, pacman, dnf, yum)

set -euo pipefail  # Exit on error, undefined vars, pipe failures

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color


# Logging functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Detect current interactive shell (bash or zsh)
detect_shell() {
    if [[ -n "${ZSH_VERSION:-}" ]]; then
        echo "zsh"
    elif [[ -n "${BASH_VERSION:-}" ]]; then
        echo "bash"
    else
        case "${SHELL:-}" in
            *zsh*) echo "zsh" ;;
            *bash*) echo "bash" ;;
            *) echo "bash" ;;
        esac
    fi
}

# Reload shell configuration so changes apply immediately
reload_shell() {
    local sh
    sh=$(detect_shell)
    log_info "Reloading ${sh} as a login shell to apply changes..."

    if [[ "$sh" == "zsh" ]]; then
        exec zsh -l
    else
        exec bash -l
    fi
}

# Detect operating system
detect_os() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "macos"
    elif [[ -f /etc/debian_version ]] || command_exists apt; then
        echo "ubuntu"
    else
        echo "unknown"
    fi
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install packages based on OS
install_packages() {
    local os="$1"
    
    case "$os" in
        "macos")
            install_macos_packages
            ;;
        "ubuntu")
            install_ubuntu_packages
            ;;
        *)
            log_error "Unsupported operating system: $os"
            exit 1
            ;;
    esac
}

# Install packages on macOS using Homebrew
install_macos_packages() {
    log_info "Installing packages on macOS..."
    
    # Check if Homebrew is installed
    if ! command_exists brew; then
        log_info "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        
        # Add Homebrew to PATH for Apple Silicon Macs
        if [[ $(uname -m) == "arm64" ]]; then
            echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
            eval "$(/opt/homebrew/bin/brew shellenv)"
        fi
    fi
    
    # Update Homebrew
    log_info "Updating Homebrew..."
    brew update
    
    # macOS packages
    local macos_packages=(
        "neovim"
        "tmux"
        "fzf"
        "fd"
        "ripgrep"
        "node"
        "git"
        "bash-completion"
    )
    
    # Install packages
    for package in "${macos_packages[@]}"; do
        if brew list "$package" >/dev/null 2>&1; then
            log_info "$package is already installed"
        else
            log_info "Installing $package..."
            brew install "$package"
        fi
    done
    
    # Install fzf key bindings
    if [[ -f /opt/homebrew/opt/fzf/install ]]; then
        /opt/homebrew/opt/fzf/install --all
    elif [[ -f /usr/local/opt/fzf/install ]]; then
        /usr/local/opt/fzf/install --all
    fi
}

# Install packages on Ubuntu/Debian
install_ubuntu_packages() {
    log_info "Installing packages on Ubuntu/Debian..."
    
    # Update package list
    log_info "Updating package list..."
    sudo apt update
    
    # Ubuntu packages
    local ubuntu_packages=(
        "neovim"
        "tmux"
        "fzf"
        "fd-find"  # Ubuntu uses fd-find instead of fd
        "ripgrep"
        "nodejs"
        "npm"
        "git"
        "bash-completion"
    )
    
    # Install packages
    for package in "${ubuntu_packages[@]}"; do
        if dpkg -l "$package" >/dev/null 2>&1; then
            log_info "$package is already installed"
        else
            log_info "Installing $package..."
            sudo apt install -y "$package"
        fi
    done
    
    # Install fzf key bindings
    if [[ -f /usr/share/doc/fzf/install ]]; then
        /usr/share/doc/fzf/install --all
    fi
}


# Create symlinks for dotfiles
install_dotfiles() {
    log_info "Installing dotfiles..."
    
    local dotfiles_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    local home_dir="$HOME"
    
    # Detect current shell to determine which rc file to install
    local current_shell=""
    if [[ -n "${ZSH_VERSION:-}" ]]; then
        current_shell="zsh"
    elif [[ -n "${BASH_VERSION:-}" ]]; then
        current_shell="bash"
    else
        # Fallback: check SHELL environment variable
        case "$SHELL" in
            *zsh*) current_shell="zsh" ;;
            *bash*) current_shell="bash" ;;
            *) current_shell="bash" ;;  # Default to bash
        esac
    fi
    
    log_info "Detected shell: $current_shell"
    
    # List of dotfiles to symlink (rc/profile files added per-shell below)
    local dotfiles=(
        ".vimrc"
        ".tmux.conf"
        ".gitconfig"
        ".gitignore_global"
        ".bash_aliases"
    )
    
    # Add appropriate rc/profile files based on detected shell
    if [[ "$current_shell" == "zsh" ]]; then
        dotfiles+=(".zshrc" ".zprofile")
        log_info "Will install .bashrc as .zshrc and .bash_profile as .zprofile for zsh compatibility"
    else
        dotfiles+=(".bashrc" ".bash_profile")
        log_info "Will install .bashrc and .bash_profile for bash"
    fi
    
    # No backups: directly replace existing files with symlinks
    
    for file in "${dotfiles[@]}"; do
        local source_file="$dotfiles_dir/$file"
        local target_file="$home_dir/$file"
        
        # Special handling for zsh: symlink .bashrc as .zshrc and .bash_profile as .zprofile
        if [[ "$current_shell" == "zsh" ]]; then
            if [[ "$file" == ".zshrc" ]]; then
                source_file="$dotfiles_dir/.bashrc"
                log_info "Using .bashrc as source for .zshrc (zsh compatibility)"
            elif [[ "$file" == ".zprofile" ]]; then
                source_file="$dotfiles_dir/.bash_profile"
                log_info "Using .bash_profile as source for .zprofile (zsh compatibility)"
            fi
        fi
        
        if [[ -f "$source_file" ]]; then
            # Remove existing target if present (file or symlink)
            if [[ -f "$target_file" || -L "$target_file" ]]; then
                rm -f "$target_file"
            fi
            # Create symlink
            log_info "Creating symlink for $file"
            ln -sf "$source_file" "$target_file"
            log_success "Linked $file"
        else
            log_warning "Source file $source_file not found, skipping..."
        fi
    done
    
    log_success "Dotfiles installation completed!"
}

# Main installation function
main() {
    log_info "Starting dotfiles installation..."
    
    # Detect OS
    local os=$(detect_os)
    log_info "Detected OS: $os"
    
    # Install packages
    install_packages "$os"
    
    # Install dotfiles
    install_dotfiles
    
    log_success "Installation completed successfully!"
    reload_shell
}

# Run main function
main "$@"