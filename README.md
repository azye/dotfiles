# dotfiles

A small setup I actually use. Works on macOS and Ubuntu. Bash and zsh both work.

## Quick start

```bash
# clone
git clone https://github.com/azye/dotfiles
cd dotfiles

# run installer (asks for sudo on Ubuntu)
./install.sh
```

What it does:
- Installs a minimal toolset (brew/apt): neovim, tmux, fzf, fd, ripgrep, git, node, bash-completion
- Symlinks configs into $HOME
  - Bash: ~/.bashrc, ~/.bash_profile, ~/.bash_aliases
  - zsh: maps .bashrc -> ~/.zshrc and .bash_profile -> ~/.zprofile
  - Editor/terminal: ~/.vimrc, ~/.tmux.conf, ~/.gitconfig, ~/.gitignore_global
- Reloads your shell so changes apply immediately
