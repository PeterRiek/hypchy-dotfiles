# Neovim Configuration

This folder contains my Lua-based Neovim configuration (`init.lua` and related files).  
It is part of my dotfiles repository, but can be used independently if desired.

## Requirements

Lua LSP depends on `binutils` and might need to be symlinked manually

```bash
sudo pacman -S binutils
```

---

## Quick Standalone Setup

You can clone the Neovim configuration either into a **custom folder** or directly into `~/.config/nvim` so Neovim recognizes it immediately.

```bash
# Option 1: Clone into a custom folder
DEST=~/Projects/my-nvim
git clone https://github.com/PeterRiek/hypchy-dotfiles.git "$DEST"
cd "$DEST"

# Option 2: Clone directly into ~/.config/nvim
# DEST=~/.config/nvim
# git clone https://github.com/PeterRiek/hypchy-dotfiles.git "$DEST"
# cd "$DEST"

# Initialize sparse checkout
git sparse-checkout init --cone

# Set only the Neovim config folder
git sparse-checkout set .config/nvim

# Checkout the files
git checkout

# Optional: move files to root of DEST instead of .config/nvim subfolder
mv .config/nvim/* .
rm -r .config
```

After this, the Neovim configuration will be ready in the folder you chose (~/.config/nvim or a custom directory).

