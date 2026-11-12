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

# 4. Append Homebrew + dotfiles loader to existing ~/.bashrc (idempotent)
touch "$HOME/.bashrc"
MARKER="# >>> ASHUdev05 dotfiles >>>"

if ! grep -qF "$MARKER" "$HOME/.bashrc"; then
    cat << 'EOF' >> "$HOME/.bashrc"

# >>> ASHUdev05 dotfiles >>>
if [ -x "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"
elif [ -x "$HOME/.linuxbrew/bin/brew" ]; then
    eval "$($HOME/.linuxbrew/bin/brew shellenv bash)"
fi

export DOTFILES="$HOME/dotfiles"
for file in "$DOTFILES/bash/"*.bash; do
    [ -r "$file" ] && source "$file"
done
# <<< ASHUdev05 dotfiles <<<
EOF
    echo "🔗 Added Homebrew & dotfiles source block to ~/.bashrc"
else
    echo "✔️ Dotfiles source block already present in ~/.bashrc"
fi

# 5. Link Neovim config (with backup if real directory exists)
if [ -e "$HOME/.config/nvim" ] && [ ! -L "$HOME/.config/nvim" ]; then
    mkdir -p "$BACKUP_DIR"
    mv "$HOME/.config/nvim" "$BACKUP_DIR/"
    echo "📁 Backed up existing nvim config to $BACKUP_DIR/"
fi
mkdir -p "$HOME/.config"
ln -sf "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
echo "🔗 Linked ~/.config/nvim -> $DOTFILES_DIR/nvim"

# 6. Headless Neovim plugin sync via lazy.nvim
if command -v nvim >/dev/null 2>&1; then
    echo "🔌 Syncing Neovim plugins..."
    nvim --headless "+Lazy! restore" +qa
fi

echo "✅ Setup complete! Restarting shell..."
exec bash