# Eza (Replacement for ls)
alias ls='eza --icons --group-directories-first'
alias ll='eza -lah --icons --group-directories-first --git'
alias lt='eza --tree --level=2 --icons' # Tree view

# Bat (Replacement for cat and man)
alias cat='batcat --paging=never'
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"

# Navigation & Utilities
alias cls='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../../'

# Search and Path
alias grep='grep --color=auto'
alias path='echo $PATH | tr ":" "\n"'

# Git related aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gl='git log --oneline --graph --all'

# apt related aliases
alias update='sudo apt update && sudo apt upgrade -y'
alias cleanup='sudo apt autoremove && sudo apt autoclean'

# The "Smart" Mkdir
alias mkdir='mkdir -pv'

# Show all custom aliases prettily
alias helpme="alias | sed 's/alias //g' | batcat -l bash --paging=never"