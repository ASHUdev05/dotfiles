#!/usr/bin/env bash
set -e

REPO_URL="https://github.com/ASHUdev05/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

echo "🚀 Bootstrapping dotfiles for ASHUdev05..."

# 1. Clone or update repository
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "📦 Cloning dotfiles repository..."
    git clone "$REPO_URL" "$DOTFILES_DIR"
else
    echo "🔄 Dotfiles directory exists. Pulling latest changes..."
    git -C "$DOTFILES_DIR" pull
fi

# 2. Install Homebrew if missing
if ! command -v brew >/dev/null 2>&1 && [ ! -x "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
    echo "🍺 Installing Homebrew..."
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Initialize brew for the current session
if [ -x "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"
elif [ -x "$HOME/.linuxbrew/bin/brew" ]; then
    eval "$($HOME/.linuxbrew/bin/brew shellenv bash)"
fi

# 3. Install tools using Brewfile
if [ -f "$DOTFILES_DIR/Brewfile" ]; then
    echo "⚙️ Installing tools from Brewfile..."
    brew bundle --file="$DOTFILES_DIR/Brewfile"
fi

# 4. Helper function to backup existing files and create symlinks
link_file() {
    local src="$1"
    local dest="$2"

    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        mkdir -p "$BACKUP_DIR"
        echo "📁 Backing up existing $dest ->$BACKUP_DIR/"
        mv "$dest" "$BACKUP_DIR/"
    fi

    mkdir -p "$(dirname "$dest")"
    ln -sf "$src" "$dest"
    echo "🔗 Linked $dest ->$src"
}

# Link configurations
link_file "$DOTFILES_DIR/bash/bashrc" "$HOME/.bashrc"
link_file "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

# 5. Headless Neovim plugin sync via lazy.nvim
if command -v nvim >/dev/null 2>&1; then
    echo "🔌 Syncing Neovim plugins..."
    nvim --headless "+Lazy! restore" +qa
fi

echo "✅ Setup complete! Restarting shell..."
exec bash