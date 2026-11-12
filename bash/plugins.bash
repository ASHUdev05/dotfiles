# Init Homebrew if installed
if [ -x "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"
elif [ -x "$HOME/.linuxbrew/bin/brew" ]; then
    eval "$($HOME/.linuxbrew/bin/brew shellenv bash)"
fi

# Init zoxide only if installed
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init bash)"
fi