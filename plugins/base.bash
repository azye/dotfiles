# general aliases
alias resource='source ~/.bash_profile'
alias ~='cd ~'
alias c='clear'
alias ..='cd ..'
alias py='python'
alias h='history'
alias cd..='cd ..'
alias ls='ls -lahp'
alias err='echo $?' # get last error code
alias configs='subl ${CONFIG_PATH}'
alias path='echo -e ${PATH//:/\\n}'

# bash $PS1
export PS1="\u { \@ } \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\n\$ "
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

# gets the git branch of current directory
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# add confirmation for clobbering files
set -o noclobber 
