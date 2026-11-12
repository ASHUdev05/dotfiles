# 🚀 My Dotfiles Ecosystem

A clean, modular, and automated setup for my terminal (**Bash**) and editor (**Neovim**), designed to bootstrap seamlessly on any fresh Linux or macOS machine with a single command.

---

## 📂 Repository Structure

text

```text
dotfiles/
├── bash/
│   ├── aliases.bash   # Safe, guarded custom aliases (eza, bat, git, apt)
│   ├── env.bash       # Environment paths (Cargo, Go, NVM, local bin)
│   └── plugins.bash   # Tool initializations (Homebrew, Zoxide)
├── nvim/              # Modular Neovim configuration (lazy.nvim plugins)
├── Brewfile           # Homebrew package bundle (CLI tools & Neovim)
└── install.sh         # Automated bootstrap script
```

## ✨ Features

- **Modular Bash Configuration:** Cleanly separated configuration files for aliases, environment variables, and third-party tool initialization.
- **Smart Guardrails:** Uses `command -v` checks to ensure missing tools never break shell startup.
- **Automated Package Management:** Uses Homebrew to install modern CLI utilities such as `eza`, `bat`, `zoxide`, `fzf`, `ripgrep`, and `neovim`.
- **Automated Neovim Setup:** Automatically installs and synchronizes plugins using `lazy.nvim`, with dependencies managed through a lockfile.
- **Safe Configuration Backups:** Existing configurations are backed up before being replaced with symlinks.

## ⚡ Quick Start — New Machine Setup

Bootstrap your entire development environment on a fresh machine with a single command.

### Using curl

bash

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/ASHUdev05/dotfiles/main/install.sh)
```

### Using wget

bash

```bash
bash <(wget -qO- https://raw.githubusercontent.com/ASHUdev05/dotfiles/main/install.sh)
```

## 🛠️ What the Installer Does

The `install.sh` script automates the following tasks:

1. **Clones or Updates the Repository**Clones the dotfiles repository into `~/dotfiles` or updates it if it already exists.
2. **Installs Homebrew**Automatically installs Homebrew using its official installation script if it is not already available.
3. **Installs CLI Tools**Installs packages defined in the `Brewfile`, including:
   - `eza`
   - `bat`
   - `zoxide`
   - `fzf`
   - `ripgrep`
   - `neovim`
4. **Backs Up Existing Configurations**Safely backs up existing `~/.bashrc` and `~/.config/nvim` configurations into a timestamped directory:
   text
   ```text
   ~/.dotfiles_backup_*
   ```
5. **Creates Symbolic Links**Links the repository configuration files to their respective locations so that changes remain synchronized with the repository.
6. **Restores Neovim Plugins**Runs Neovim headlessly to install and synchronize all plugins through `lazy.nvim`, making the editor ready to use immediately.

## 🖼️ Preview

\!Dotfiles Preview

## 📌 Customization

You can customize this setup by editing the modular configuration files:

| File | Purpose |
| --- | --- |
| `bash/aliases.bash` | Custom shell aliases |
| `bash/env.bash` | Environment variables and PATH configuration |
| `bash/plugins.bash` | Third-party tool initialization |
| `bash/bashrc` | Main Bash configuration entrypoint |
| `Brewfile` | CLI tools and package management |
| `nvim/` | Neovim configuration and plugins |
| `install.sh` | Automated installation and setup logic |

## 🤝 Contributing

Suggestions, improvements, and bug reports are welcome\!

Feel free to fork this repository, customize it for your workflow, and submit a pull request.

---

**Happy Hacking\!** 🚀