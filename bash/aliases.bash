# Eza (Replacement for ls)
if command -v eza >/dev/null 2>&1; then
    alias ls='eza --icons --group-directories-first'
    alias ll='eza -lah --icons --group-directories-first --git'
    alias lt='eza --tree --level=2 --icons'
fi

# Bat (Handles both 'bat' from brew and 'batcat' from apt)
if command -v bat >/dev/null 2>&1; then
    alias cat='bat --paging=never'
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
    alias helpme="alias | sed 's/alias //g' | bat -l bash --paging=never"
elif command -v batcat >/dev/null 2>&1; then
    alias cat='batcat --paging=never'
    export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
    alias helpme="alias | sed 's/alias //g' | batcat -l bash --paging=never"
fi

# Navigation & Utilities
alias cls='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../../'
alias grep='grep --color=auto'
alias path='echo $PATH | tr ":" "\n"'
alias mkdir='mkdir -pv'

# Git related aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gl='git log --oneline --graph --all'

# Apt related aliases (Debian/Ubuntu specific)
if command -v apt >/dev/null 2>&1; then
    alias update='sudo apt update && sudo apt upgrade -y'
    alias cleanup='sudo apt autoremove && sudo apt autoclean'
fi